// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'Index.dart';
import 'core/constants/colors.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool proceed = false;

  @override
  void initState() {
    super.initState();

    // initDB();

    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        proceed = true;
        // goToLogin();
        // goToHome();
        // goToHome();
      }
    });
  }

  // void initDB() async {
  //   try {
  //     await dashboardDB.initialize();
  //     await billDB.initialize();
  //   } catch (e) {
  //     debugPrint('init db error: $e');
  //   }
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Future<void> goToLogin() async {
  //   if (customers > 0) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => Index(),
  //       ),
  //     );
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => LoginAndRegister(),
  //       ),
  //     );
  //   }
  // }

  Future<void> goToHome() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Index(),
      ),
    );
  }

  // Future<void> goToLogin() async {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => const LoginAndRegister(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: animation.value * 200,
            ),
            // Center(
            //   child: Text(
            //     "Harmony Life",
            //     style: GoogleFonts.quattrocento(
            //       textStyle: TextStyle(
            //         fontSize: animation.value * 20,
            //         letterSpacing: 8,
            //         fontWeight: FontWeight.w300,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            // Divider(
            //   indent: 60,
            //   endIndent: 60,
            //   color: kGreenTextColor,
            //   thickness: 1,
            // ),
            Center(
              child: Text(
                "Laundry Konnect",
                style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w100,
                    color: Colors.black87,
                    // color: Color(0xFF01B000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void fetchDashboardData() async {
  //   try {
  //     // showDialog(
  //     //   context: context,
  //     //   builder: (context) {
  //     //     return const ProgressDialog(displayMessage: 'Please wait...');
  //     //   },
  //     // );
  //     NetworkUtility networkUtility = NetworkUtility();
  //     Response response =
  //         await networkUtility.getData('$DASHBOARD_URL?$ownerId');

  //     debugPrint('dashboard response: ${response.body}');
  //     debugPrint('response code: ${response.statusCode}');

  //     if (response.statusCode == 200 && response != null) {
  //       //parse data received
  //       var data = jsonDecode(response.body);

  //       //process dashboard data
  //       DashboardModel dashboardModel = DashboardModel(
  //         billCount: data['data']['billCount'].toString(),
  //         billSum: data['data']['billSum'].toString(),
  //         prrCount: data['data']['prrCount'].toString(),
  //         prrSum: data['data']['prrSum'].toString(),
  //         bopCount: data['data']['bopCount'].toString(),
  //         bopSum: data['data']['bopSum'].toString(),
  //         paymentCount: data['data']['paymentCount'].toString(),
  //         paymentSum: data['data']['paymentSum'].toString(),
  //         totalOutStanding: data['data']['totalOutStanding'].toString(),
  //         litigationCount: data['data']['litigationCount'].toString(),
  //         owner: ownerId,
  //       );

  //       debugPrint('dashboard model from server: $dashboardModel');
  //       await dashboardDB.insertObject(dashboardModel);

  //       var currentBills = data['data']['currentBills'] as List;
  //       debugPrint('current bills: ${currentBills.length}');

  //       if (currentBills.isNotEmpty) {
  //         List<BillModel> billList = [];
  //         for (int i = 0; i < currentBills.length; i++) {
  //           BillModel model = BillModel(
  //             id: currentBills[i]['id'],
  //             assemblyId: currentBills[i]['assemblyId'].toString(),
  //             invoiceType: currentBills[i]['invoiceType'].toString(),
  //             invoiceNo: currentBills[i]['invoiceNo'].toString(),
  //             invoiceYear: currentBills[i]['invoiceYear'].toString(),
  //             invoiceMonth: currentBills[i]['invoiceMonth'].toString(),
  //             fiscalYr: currentBills[i]['fiscalYr'].toString(),
  //             freqType: currentBills[i]['freqType'].toString(),
  //             generatedOn: currentBills[i]['generatedOn'].toString(),
  //             dueDate: currentBills[i]['dueDate'].toString(),
  //             rate: currentBills[i]['rate'].toString(),
  //             consumptionValue: currentBills[i]['consumptionValue'].toString(),
  //             arrears: currentBills[i]['arrears'].toString(),
  //             adjustment: currentBills[i]['adjustment'].toString(),
  //             currentAmount: currentBills[i]['currentAmount'].toString(),
  //             amountDue: currentBills[i]['amountDue'].toString(),
  //             ownerId: currentBills[i]['owner']['ownerId'],
  //             name: currentBills[i]['owner']['name'],
  //             type: currentBills[i]['owner']['type'],
  //             phone: currentBills[i]['owner']['phone'],
  //             email: currentBills[i]['owner']['email'],
  //           );

  //           billList.add(model);
  //         }

  //         debugPrint('billList: $billList');
  //         if (billList.isNotEmpty) {
  //           for (BillModel bill in billList) {
  //             await billDB.insertObject(bill);
  //           }
  //         }
  //       }

  //       // await dashboardDB.initialize();
  //       // await billDB.initialize();
  //     } else {
  //       UtilityService().showMessage(
  //         message: 'Sorry, an error occurred while downloading dashboard data',
  //         context: context,
  //         icon: const Icon(
  //           Icons.cancel,
  //           color: Colors.redAccent,
  //         ),
  //       );
  //     }
  //     proceed = true;
  //   } catch (e) {
  //     debugPrint('fetch dashboard data error: $e');
  //     UtilityService().showMessage(
  //       message: 'Sorry, an error occurred while downloading dashboard data',
  //       context: context,
  //       icon: const Icon(
  //         Icons.cancel,
  //         color: Colors.redAccent,
  //       ),
  //     );
  //     proceed = true;
  //   }
  // }

}