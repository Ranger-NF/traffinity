import 'package:flutter/material.dart';
import 'package:frontend/models/report_model.dart';
import 'package:frontend/services/reports_services.dart';

class EmergencyProvider extends ChangeNotifier {
  bool _isEmergency = false;
  bool get isEmergency => _isEmergency;

  final ReportsServices _services = ReportsServices();

  void onTapEmergency(){
    final ReportModel report = ReportModel(type: 'emergency', location: '');
    _services.submitReport(report);
    _isEmergency = !_isEmergency;
    notifyListeners();
  }
}