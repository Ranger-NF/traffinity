import 'package:dio/dio.dart';
import 'package:frontend/models/report_model.dart';
import 'dart:convert';


class ReportsServices {

  // get Reports
  Future<List<Map<String, dynamic>>?> getReports() async {
    final dio = Dio();

    try {
      final response = await dio.get('https://traffinity.onrender.com/reports');
    
      if (response.statusCode == 200) {
        final data = response.data;
        print("Response: $data");

        // If you want to access values
        for (var report in data) {
          print('Type: ${report['type']}');
          print('Location: ${report['location']}');
          print('ID: ${report['id']}');
        }

        return (data as List).map((item) => Map<String, dynamic>.from(item)).toList();
        
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching reports: $e');
      return null;
    }
  }

  // post the report

  Future<bool> submitReport(ReportModel report) async {
    final dio = Dio();
    const String url = 'https://traffinity.onrender.com/report';


    final reportData = jsonEncode(report.toJson());
    try {
      final response = await dio.post(url, data: reportData);

      if (response.statusCode == 200 || response.statusCode == 201) {

        print("Report submitted successfully!");
        return true;
      } else {
        print("Failed to submit report. Status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error submitting report: $e");
      return false;
    }
  }

    Future<int?> submitEmergency(ReportModel report) async {
    final dio = Dio();
    const String url = 'https://traffinity.onrender.com/emergency';


    final reportData = jsonEncode(report.toJson());
    try {
      final response = await dio.post(url, data: reportData);
      final id = response.data["id"];

      if (response.statusCode == 200 || response.statusCode == 201) {

        print("Report submitted successfully!");
        return id;
      } else {
        print("Failed to submit report. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error submitting report: $e");
      return null;
    }
  }

  // Update the Report
  Future<bool> updateReport(ReportModelId report) async {
    final dio = Dio();

    const String url = 'https://traffinity.onrender.com/report';

    final updateData = jsonEncode(report.toJson());

    try {
      final response = await dio.put(
        url,
        data: updateData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print("Report updated successfully!");
        print("Response: ${response.data}");
        return true;
      } else {
        print("Failed to update report. Status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error updating report: $e");
      return false;
    }
  }

  // Resolve the Report
  Future<bool> resolveReport(int id) async{
    final dio = Dio();
    const String url = 'https://traffinity.onrender.com/resolve';

    Map<String,int> data = {
      "id": id
    };

    final jsonData = jsonEncode(data);

    try{
      final response = await dio.post(
        url,
        data: jsonData
      );

      if (response.statusCode == 200) {
        print("Report Resolved successfully!");
        return true;
      } else {
        print("Failed to resolve report. Status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error resolve report: $e");
      return false;
    }

  }
  
    // Resolve the Report
  Future<bool> resolveEmergency(int id) async{
    final dio = Dio();
    const String url = 'https://traffinity.onrender.com/resolve/emergency';

    Map<String,int> data = {
      "id": id
    };

    final jsonData = jsonEncode(data);

    try{
      final response = await dio.post(
        url,
        data: jsonData
      );

      if (response.statusCode == 200) {
        print("Report Resolved successfully!");
        return true;
      } else {
        print("Failed to resolve report. Status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error resolve report: $e");
      return false;
    }

  }
}

