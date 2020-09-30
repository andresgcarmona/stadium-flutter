
import 'dart:async';
import 'dart:developer';

import 'package:stadium/core/models/user.dart';
import 'package:stadium/core/services/api.dart';
import 'package:stadium/core/services/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String email, String password) async {
    var user = await _api.authenticateUser(email, password);

    log(user.email.toString());

    if(user != null) {
      userController.add(user);
    }

    return user != null;
  }
}