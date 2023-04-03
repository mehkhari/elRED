import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{
  bool _passwordVisible=false;
  bool _isLogin=false;
  List<String> _docIds=[];

  get passwordVisible=>_passwordVisible;
  get isLogin=>_isLogin;
  get docIds=>_docIds;

  changeVisibility(){
    _passwordVisible=!_passwordVisible;
    notifyListeners();
  }
  toggleLogin(){
    _isLogin=!_isLogin;
    notifyListeners();
  }

  addIds(String id){
    _docIds.add(id);
    notifyListeners();
  }
}