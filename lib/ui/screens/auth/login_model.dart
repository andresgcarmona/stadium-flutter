import 'dart:developer';

import 'package:stadium/core/contracts/base_model.dart';
import 'package:stadium/core/enums/viewstate.dart';
import 'package:stadium/core/services/authentication.dart';
import 'package:stadium/core/services/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String emailError;
  String passwordError;

  void setEmailError({String error: 'Email is required'}) {
    emailError = error;

    notifyListeners();
  }

  void setPasswordError({String error: 'Password is required'}) {
    passwordError = error;

    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);

    if (email == null) {
      emailError = 'Email is required';
      setState(ViewState.Idle);

      return false;
    }

    if (password == null) {
      passwordError = 'Password is required';
      setState(ViewState.Idle);

      return false;
    }

    log(email.toString());

    var response = await _authenticationService.login(email, password);

    setState(ViewState.Idle);

    return response;
  }
}
