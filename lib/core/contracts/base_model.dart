import 'package:flutter/cupertino.dart';
import 'package:stadium/core/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;

    notifyListeners();
  }
}
