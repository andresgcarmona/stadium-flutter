import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/providers/user_provider.dart';
import 'package:stadium/widgets/login_form.dart';
import 'package:stadium/widgets/stadium_login_form.dart';

void main() => runApp(ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool showOriginalLogin = false;

  @override
  Widget build(BuildContext context) {
    return showOriginalLogin
        ? Scaffold(
            appBar: AppBar(
              title: Text('Login form'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[LoginForm()],
              ),
            ),
          )
        : Scaffold(
            body: StadiumLoginForm());
  }
}
