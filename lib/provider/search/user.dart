import 'package:flutter/material.dart';

class ProviderUserSearch with ChangeNotifier{

  ProviderUserSearch();

  String _displayUser;

  void setDisplayUser(String _textUser){
    _displayUser = _textUser;
    notifyListeners();
  }

  String get getDisplayUser => _displayUser;

}