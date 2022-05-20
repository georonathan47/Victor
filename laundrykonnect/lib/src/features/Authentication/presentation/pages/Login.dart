// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laundrykonnect/Index.dart';

class LoginAndRegister extends StatelessWidget {
  final loginAction;
  final String loginError;

  const LoginAndRegister(this.loginAction, this.loginError, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Index();
  }
}
