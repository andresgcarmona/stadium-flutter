import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/core/models/user.dart';
import 'package:stadium/core/services/authentication.dart';
import 'package:stadium/core/services/locator.dart';
import 'package:stadium/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) => locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Stadium',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}