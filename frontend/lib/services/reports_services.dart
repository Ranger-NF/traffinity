import 'package:dio/dio.dart';


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

  void submitReport() async {
    final dio = Dio();
    const String url = 'https://traffinity.onrender.com/report';

    final Map<String, String> reportData = {
      "type": "potholes",
      "location": "Highway 1 near exit 5"
    };

    try {
      final response = await dio.post(url, data: reportData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        print("Report submitted successfully!");
        print("Response: $responseData");

        print("ID: ${responseData['id']}");
      } else {
        print("Failed to submit report. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error submitting report: $e");
    }
  }

  // Update the Report
  void updateReport() async {
    final dio = Dio();

    const String url = 'https://traffinity.onrender.com/report';

    final Map<String, dynamic> updateData = {
      "id": 1,
      "type": "accident", 
      "location": "Updated location"
    };

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
      } else {
        print("Failed to update report. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error updating report: $e");
    }
  }

}