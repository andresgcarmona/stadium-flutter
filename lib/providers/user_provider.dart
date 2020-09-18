import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:stadium/models/user.dart';
import 'package:stadium/requests/stadium_request.dart';

class UserProvider extends ChangeNotifier {
  User user;
  String errorMessage;
  String token;
  bool loading = false;

  Future<bool> authenticateUser(String username, String password) async {
    setLoading(true);

    await Stadium(username, password).authenticateUser().then((data) {
      log(json.decode(data.body).toString());

      setLoading(false);

      if (data.statusCode == 200) {
        var response = json.decode(data.body);

        setUser(User.fromJson(response));

        setToken(response['token']);
      } else {
        Map<String, dynamic> response = json.decode(data.body);

        setMessage('User ' + response['error']);
      }
    });

    return isUser();
  }

  void setLoading(loading) {
    this.loading = loading;

    notifyListeners();
  }

  void setUser(user) {
    this.user = user;

    notifyListeners();
  }

  void setMessage(message) {
    this.errorMessage = message;

    notifyListeners();
  }

  bool isUser() {
    return user != null;
  }

  String getMessage() => errorMessage;

  User getUser() => user;

  bool isLoading() => loading;

  void setToken(String token) {
    this.token = token;
  }

  String getToken() => token;
}
