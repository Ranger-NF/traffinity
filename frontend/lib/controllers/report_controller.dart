import 'package:shared_preferences/shared_preferences.dart';

class ReportController {
  void setTheId(int id) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('rid', id);
  }

  Future<int?> getTheId() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('rid');
    return id;
  }
}