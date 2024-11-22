import 'package:flutter/material.dart';

class Widgetcontroller extends ChangeNotifier {

  bool textIsobscure=true;

  void isObscure(){
    textIsobscure=!textIsobscure;
    notifyListeners();

  }

}