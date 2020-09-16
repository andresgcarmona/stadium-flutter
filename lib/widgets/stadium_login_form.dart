import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/providers/user_provider.dart';
import 'package:stadium/screens/following.dart';

class StadiumLoginForm extends StatefulWidget {
  @override
  _StadiumLoginFormState createState() => _StadiumLoginFormState();
}

class _StadiumLoginFormState extends State<StadiumLoginForm> {
  TextEditingController _controller = TextEditingController();

  void _getUser() {
    if (_controller.text == '') {
      Provider.of<UserProvider>(context)
          .setMessage('Please enter your username');
    } else {
      Provider.of<UserProvider>(context)
          .fetchUser(_controller.text)
          .then((value) {
        if (value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FollowingPage(),
              ));
        }
      });
    }
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
                    Provider.of<UserProvider>(context).setMessage(null);
                  },
                  controller: _controller,
                  enabled: !Provider.of<UserProvider>(context).isLoading(),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      errorText:
                          Provider.of<UserProvider>(context).getMessage(),
                      border: InputBorder.none,
                      hintText: 'Username',
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
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
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
                  _getUser();
                },
                child: Align(
                  child: Provider.of<UserProvider>(context).isLoading()
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
