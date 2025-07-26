import 'package:flutter/material.dart';

class AlertShowProvider extends ChangeNotifier{
  bool _isAlert = true;
  bool get isAlert => _isAlert;

  void changeAlertScreen(){
    _isAlert = !_isAlert;
    notifyListeners();
  }

}