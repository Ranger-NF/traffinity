import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/providers/alert_show_provider.dart';
import 'package:frontend/providers/emergency_provider.dart';
import 'package:frontend/services/reports_services.dart';
import 'package:frontend/views/widgets/alert_widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EmergencyAlertPage extends StatefulWidget {
  @override
  State<EmergencyAlertPage> createState() => _StateEmergencyAlertPage();
}

class _StateEmergencyAlertPage extends State<EmergencyAlertPage>{

  void emergencyButton(){
    
  }
  

  final ReportsServices _service = ReportsServices();
  @override
  Widget build(BuildContext context) {
    final emergencyProvider = Provider.of<EmergencyProvider>(context);
    final alertShowProvider = Provider.of<AlertShowProvider>(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              color: LightColors.primary,
              height: 500,
              padding: AppTheme.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Friday", style: AppTheme.h6Style),
                  Text("Alerts!", style: AppTheme.h1Style),
                  Expanded(
                    child: !alertShowProvider.isAlert
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
                                alertShowProvider.changeAlertScreen();
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
                                      onTap: report['type'] == "emergency" ? (){} : () {},
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
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonsWidgets.rectangularButton(),
                    SizedBox(height: 120,),
                    emergencyProvider.isEmergency ? ButtonsWidgets.isEmergencyButton(
                      onTap: emergencyProvider.onTapEmergency
                    ) : 
                    ButtonsWidgets.isNotEmergencyButton(onTap: emergencyProvider.onTapEmergency)

                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}