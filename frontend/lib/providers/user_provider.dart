import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
    bool _isUser = true;
    bool get isUser => _isUser;

    void changeUser(){
        _isUser = !_isUser;
        notifyListeners();
    }
}