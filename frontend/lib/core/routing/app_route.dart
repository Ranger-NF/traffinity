import 'package:flutter/material.dart';
import 'package:frontend/views/pages/add_alert_page.dart';
import 'package:frontend/views/pages/alert_page.dart';
import 'package:frontend/views/pages/edit_alert_page.dart';
import 'package:frontend/views/pages/emergency_alert_page.dart';
import 'package:frontend/views/pages/welcome_page.dart';

class AppRoute {

  static Map<String, WidgetBuilder> appRoute = {
    '/': (_) => WelcomePage(),
    '/alert': (_) => AlertPage(),
    '/edit': (_) => EditAlertPage(),
    '/add': (_) => AddAlertPage(),
    '/emergency_alert': (_) => EmergencyAlertPage()
  };
}