import 'dart:async';
import 'package:flutter/material.dart';
import 'package:melasense/util/routes/routes_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RouteNames.onboarding);
    });
  }
}
