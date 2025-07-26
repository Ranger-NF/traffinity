import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/controllers/report_controller.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/providers/alert_show_provider.dart';
import 'package:frontend/services/reports_services.dart';
import 'package:frontend/views/widgets/alert_widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AlertPage extends StatefulWidget {
  @override
  State<AlertPage> createState() => _StateAlertPage();
}

class _StateAlertPage extends State<AlertPage> {
  final ReportsServices _service = ReportsServices();
  final ReportController _controller = ReportController();

  void clickAlertBox(BuildContext context, int id) async {
    _controller.setTheId(id);
    await Navigator.pushNamed(context, '/edit');
    Provider.of<AlertShowProvider>(context, listen: false).notifyListeners();
  }

  void reportAlert(BuildContext context) async {
    await Navigator.pushNamed(context, '/add');
    Provider.of<AlertShowProvider>(context, listen: false).notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlertShowProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 500,
                    color: LightColors.primary,
                    padding: AppTheme.screenPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Friday", style: AppTheme.h6Style),
                        Text("Alerts!", style: AppTheme.h1Style),
                        Expanded(
                          child: !provider.isAlert
                              ? Center(
                                  child: Text("No Alerts!", style: AppTheme.h2Style),
                                )
                              : FutureBuilder<List<Map<String, dynamic>>?>(
                                  future: _service.getReports(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Center(child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Center(child: Text('Error: ${snapshot.error}'));
                                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                      return Center(child: Text('No reports found.'));
                                    }

                                    final reports = snapshot.data;
                                    if(reports == null){
                                      provider.changeAlertScreen();
                                    }
                                    return ListView.builder(
                                      padding: const EdgeInsets.all(16),
                                      itemCount: reports!.length,
                                      itemBuilder: (context, index) {
                                        final report = reports[index];
                                        int id = report['id'];
                                        String isoTime = report['lastModified'];
                                        DateTime dateTime = DateTime.parse(isoTime).toLocal();
                                        String formattedTime = DateFormat('hh:mm a').format(dateTime);

                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 12.0),
                                          child: AlertWidgets.alertBox(
                                            onTap: () => clickAlertBox(context, id),
                                            isEmergency: false,
                                            context: context,
                                            incident: report['type'],
                                            location: report['location'],
                                            time: formattedTime,
                                            icon: report['type'] == "potholes"
                                                ? TablerIcons.traffic_cone
                                                : report['type'] == "accident"
                                                    ? TablerIcons.car_crash :
                                                    report['type'] == "emergency" ?
                                                    TablerIcons.activity_heartbeat
                                                    : TablerIcons.clock_hour_8,
                                            color: report['type'] == "potholes"
                                                ? LightColors.lowPriority
                                                : report['type'] == "accident"
                                                    ? LightColors.highPriority :
                                                    report["type"] == "emergency" ? 
                                                    LightColors.highPriority
                                                    : LightColors.mediumPriority,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ButtonsWidgets.rectangularButton(),
                  const SizedBox(height: 60),
                  ButtonsWidgets.roundedButton(
                    onTap: () => reportAlert(context),
                    width: 350,
                    height: 69,
                    text: "Report An Alert",
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
