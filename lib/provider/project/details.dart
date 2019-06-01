import 'package:flutter/material.dart';

class ProviderProjectDetail with ChangeNotifier{

  ProviderProjectDetail();

  String _displayUser = "";
  String _displayProject = "";

  String _displayCategory = "";
  String _displayDescription = "";

  String _link = "";

  void setDisplayUser(String _value){
    _displayUser = _value;
    notifyListeners();
  }

  void setDisplayProject(String _value){
    _displayProject = _value;
    notifyListeners();
  }

  void setDisplayCategory(String _value){
    _displayCategory = _value;
    notifyListeners();
  }

  void setDisplayDescription(String _value){
    _displayDescription = _value;
    notifyListeners();
  }

  void setLink(String _textUser){
    _link = _textUser;
    notifyListeners();
  }

  void getData(){
    setDisplayUser("User name");
    setDisplayCategory("Cattegory");
    setDisplayProject("Project name, image will be cattegory");
    setDisplayDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
  }

  String get getDisplayUser => _displayUser;
  String get getDisplayProject => _displayProject;
  String get getDisplayCategory => _displayCategory;
  String get getDisplayDescription => _displayDescription;
  String get getLink => _link;

}