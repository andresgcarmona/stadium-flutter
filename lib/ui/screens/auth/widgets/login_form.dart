import 'package:flutter/material.dart';
import 'package:stadium/core/enums/viewstate.dart';
import 'package:stadium/ui/screens/auth/login_model.dart';

class LoginForm extends StatefulWidget {
  final LoginModel model;

  @override
  _LoginFormState createState() => _LoginFormState();

  LoginForm({this.model});
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<bool> _authenticateUser() async {
    if (_emailController.text == '') {
      widget.model.setEmailError();

      return Future<bool>.value(false);
    }

    if (_passwordController.text == '') {
      widget.model.setPasswordError();

      return Future<bool>.value(false);
    }

    await widget.model
        .login(_emailController.text, _passwordController.text)
        .then((value) async {
      if (value) {
        var returnedValue = await Navigator.pushNamed(context, 'profile');

        return Future<bool>.value(returnedValue != null);
      }
    });

    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  )),
              SizedBox(height: 30),
              Text('Stadium',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0)),
              SizedBox(height: 15.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: Colors.white.withOpacity(.1)),
                child: TextField(
                  onChanged: (value) {
                    widget.model.setEmailError(error: null);
                  },
                  controller: _emailController,
                  enabled: widget.model.state == ViewState.Idle,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      errorText: widget.model.emailError,
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Colors.white.withOpacity(.1)),
                child: TextField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  enabled: widget.model.state == ViewState.Idle,
                  onChanged: (value) {
                    widget.model.setPasswordError(error: null);
                  },
                  decoration: InputDecoration(
                      errorText: widget.model.passwordError,
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                padding: EdgeInsets.all(20.0),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  _authenticateUser();
                },
                child: Align(
                  child: widget.model.state == ViewState.Busy
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2.0,
                        )
                      : Text('Login',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              )
            ],
          ),
        ));
  }
}
