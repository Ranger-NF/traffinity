import 'package:flutter/material.dart';

class EmergencyProvider extends ChangeNotifier {
  bool _isEmergency = false;
  bool get isEmergency => _isEmergency;

  void onTapEmergency(){
    _isEmergency = !_isEmergency;
    notifyListeners();
  }
}