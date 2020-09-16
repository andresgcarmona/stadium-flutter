import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:stadium/models/user.dart';
import 'package:stadium/requests/github_request.dart';

class UserProvider extends ChangeNotifier {
  User user;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchUser(username) async {
    setLoading(true);

    await Github(username).fetchUser().then((data) {
      log(json.decode(data.body).toString());

      setLoading(false);

      if(data.statusCode == 200) {
        setUser(User.fromJson(json.decode(data.body)));
      }
      else {
        Map<String, dynamic> response = json.decode(data.body);

        setMessage('User ' + response['message']);
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

  String getMessage() => this.errorMessage;

  User getUser() => this.user;

  bool isLoading() => this.loading;
}
