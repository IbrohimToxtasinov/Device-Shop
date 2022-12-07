import 'package:device_shop/screens/auth/login_page/login_page.dart';
import 'package:device_shop/screens/auth/register_page/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = true;

  @override
  Widget build(BuildContext context) {
    return isLogged
        ? LoginPage(onClickSignUp: switchAuthPages)
        : RegisterPage(onClickedSignIn: switchAuthPages);
  }
  void switchAuthPages() => setState(() {
        isLogged = !isLogged;
      });
}