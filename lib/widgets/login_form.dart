import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    
    _emailController.addListener(() { 
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Email value ${_emailController.text}"),));
    });
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'email@example.com', labelText: 'Email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                controller: _emailController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password', labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                onChanged: (value) {
                  print("Password value $value");
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(_emailController.text)));
                  }
                },
                child: Text('Submit'),
              )
            ],
          )),
    );
  }
}
