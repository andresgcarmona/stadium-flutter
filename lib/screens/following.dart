import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/models/user.dart';
import 'package:stadium/providers/user_provider.dart';
import 'package:stadium/requests/github_request.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  User user;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      user = Provider.of<UserProvider>(context).getUser();

      Github(user.login).fetchFollowing().then((following) {
        Iterable list = json.decode(following.body);

        setState(() {
          users = list.map((model) => User.fromJson(model)).toList();
        });
      });
    });

    return Scaffold(
        body: Container(
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ), onPressed: () {
                    Navigator.pop(context);
                },
                ),
                backgroundColor: Colors.white,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(user.avatarURL),
                          ),
                        ),
                        Text(
                          user.login,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: 600,
                    child: users != null
                        ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[200]))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(users[index].avatarURL),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(users[index].login, style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),)
                                ],
                              ),
                              Text('Following', style: TextStyle(color: Colors.blue),)
                            ],
                          ),
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: users.length,
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
