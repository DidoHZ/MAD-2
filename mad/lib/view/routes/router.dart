import 'package:flutter/material.dart';
import 'package:mad/constants/strings.dart';
import 'package:mad/view/home.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return null;
    }
  }
}
