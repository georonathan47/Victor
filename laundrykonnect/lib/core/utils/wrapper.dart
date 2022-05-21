import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laundrykonnect/Index.dart';
import 'package:laundrykonnect/core/constants/colors.dart';
import 'package:laundrykonnect/core/constants/widgetFunctions.dart';

import 'Path.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isBusy = false;
  bool isLoggedIn = false;
  late String errorMessage;
  late String name;
  late String picture;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? const Index()
        : Container(
            height: MediaQuery.of(context).size.height * 2.275,
            decoration: const BoxDecoration(color: kBACKGROUND_COLOR),
            padding: const EdgeInsets.all(25),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 125),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png'),
                    // addVertical(20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kSecondColor,
                          // side: Border.all(const Radius.circular(15)),
                          // shape: ,
                        ),
                        onPressed: () => loginAction(showIndicator: true),
                        // .then(
                        //   (value) => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const Index(),
                        //     ),
                        //   ),
                        // ),
                        child: addSubText(
                          'LOGIN',
                          color: Colors.white,
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    addVertical(35),
                    isBusy
                        ? const CircularProgressIndicator.adaptive()
                        : Container(),
                  ],
                ),
              ),
            ),
          );
  }

  Map<String, dynamic> parseIdToken(String? idToken) {
    final parts = idToken!.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
      utf8.decode(
        base64Url.decode(base64Url.normalize(parts[1])),
      ),
    );
  }

  Future<Map> getUserDetails(String? accessToken) async {
    const url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

  Future<void> loginAction({bool? showIndicator}) async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    showIndicator! ? const CircularProgressIndicator.adaptive() : null;

    try {
      final AuthorizationTokenResponse? result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          CLIENT_ID,
          REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login'],
        ),
      );

      final idToken = parseIdToken(result?.idToken);
      final profile = await getUserDetails(result?.accessToken);

      await secureStorage.write(
        key: 'refresh_token',
        value: result?.refreshToken,
      );

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        CLIENT_ID,
        REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response?.idToken);
      final profile = await getUserDetails(response?.accessToken);

      secureStorage.write(key: 'refresh_token', value: response?.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
}
