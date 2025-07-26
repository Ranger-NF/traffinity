import 'package:flutter/material.dart';
import 'package:frontend/controllers/report_controller.dart';
import 'package:frontend/models/report_model.dart';
import 'package:frontend/services/reports_services.dart';

class EmergencyProvider extends ChangeNotifier {

  final ReportController _controller = ReportController();
  bool _isEmergency = false;
  bool get isEmergency => _isEmergency;


  final ReportsServices _services = ReportsServices();

  void onTapEmergency(){
    final ReportModel report = ReportModel(type: 'emergency',location: 'kottakkal');
    _services.submitEmergency(report);
    _isEmergency = !_isEmergency;
    notifyListeners();
  }

  void onUnTapEmergency(BuildContext context) async{
    final id = await _controller.getTheId();
    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ID not found")),
      );
      return;
    } 
    print("Id $id");
    _services.resolveEmergency(id);
    _isEmergency = !_isEmergency;
    notifyListeners();
  }

}