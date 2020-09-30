import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:stadium/core/models/user.dart';

class Api {
  static const host = 'http://10.0.2.2:8022/api/v1';

  http.Client client = http.Client();

  Future<User> authenticateUser(String email, String password) async {
    final http.Response response = await client.post(
        '$host/auth/login',
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        })
    );

    log(response.body.toString());

    if(response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }

    return null;
  }
}