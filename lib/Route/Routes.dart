import 'package:flutter/material.dart';
import 'package:login/View/userAuth/Login.dart';
import 'package:login/View/userAuth/Otplogin.dart';
import 'package:login/View/userAuth/Registration.dart';
import 'package:login/View/Home/HomePage.dart';

class AppRoutes {
  AppRoutes._();

  static const String Login = '/login-page';
  static const String Register = '/register-page';
  static const String Optlogin = '/cart-page';
  static const String Home = '/home-screen';

  static Map<String, WidgetBuilder> define() {
    return {
      Login: (context) => LoginPage(),
      Register: (context) => RegisterPage(),
      Optlogin: (context) => OtpScreen(),
      Home: (context) => HomePage(),
    };
  }
}
