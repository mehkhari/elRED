import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{
  bool _passwordVisible=false;

  get passwordVisible=>_passwordVisible;

  changeVisibility(){
    _passwordVisible=!_passwordVisible;
    notifyListeners();
  }
}