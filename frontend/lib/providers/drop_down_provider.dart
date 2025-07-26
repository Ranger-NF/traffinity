import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class DropDownProvider extends ChangeNotifier{
  List<Map<String, dynamic>>? options;

  DropDownProvider({
    required this.options
  });

  String _selectedLabel = 'accident';
  String get selectedLabel => _selectedLabel;

  IconData _selectedIcon = TablerIcons.car_crash;
  IconData get selectedIcon => _selectedIcon;

  void selectOption(Map<String, dynamic> option){
    _selectedLabel = option['label'];
    _selectedIcon = option['icon'];
    notifyListeners();
  }




}