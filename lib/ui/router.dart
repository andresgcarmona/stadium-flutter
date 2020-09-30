import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stadium/ui/screens/auth/login.dart';
import 'package:stadium/ui/screens/home/home.dart';
import 'package:stadium/ui/screens/profile/profile.dart';

const String initialRoute = 'login';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                    body: Center(
                      child: Text(
                          'No route defined with name ${settings.name}'),
                    )
                )
        );
    }
  }
}