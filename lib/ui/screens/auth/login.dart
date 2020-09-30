import 'package:flutter/material.dart';
import 'package:stadium/core/contracts/view_builder.dart';
import 'package:stadium/ui/screens/auth/login_model.dart';
import 'package:stadium/ui/screens/auth/widgets/login_form.dart';
import 'package:stadium/ui/values/colors.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewBuilder<LoginModel>(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: bgColor,
        body: Column(
          children: <Widget>[
            LoginForm(model: model)
          ],
        ),
      ),
    );
  }
}
