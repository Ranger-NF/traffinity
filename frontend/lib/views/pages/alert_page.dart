import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/providers/alert_show_provider.dart';
import 'package:frontend/services/reports_services.dart';
import 'package:frontend/views/widgets/alert_widgets.dart';
import 'package:provider/provider.dart';

class AlertPage extends StatefulWidget {
  @override
  State<AlertPage> createState() => _StateAlertPage();
}

class _StateAlertPage extends State<AlertPage>{

  late List<Map<String, dynamic>> reports;

  void reportAlert(BuildContext context){
    Navigator.pushNamed(context, '/add');
  }

  final ReportsServices _service = ReportsServices();

  @override
  Widget build(BuildContext context) {
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
                  Text("Friday",style: AppTheme.h6Style,),
                  Text("Alerts!",style: AppTheme.h1Style,),
                  Consumer<AlertShowProvider>(builder: (context, provider, child){
                    return provider.isAlert ? Container(
                      child: Column(
                        spacing: 15,
                        children: [
                          SizedBox(height: 10,),
                          // AlertWidgets.alertBox(
                          //   isEmergency: false,
                          //   color: LightColors.highPriority,
                          //   icon: TablerIcons.car_crash,
                          //   incident: "Accident",
                          //   location: "Kottakkal",
                          //   time: "1 Hour",
                          //   context: context
                          // ),
                          // AlertWidgets.alertBox(
                          //   isEmergency: false,
                          //   color: LightColors.highPriority,
                          //   icon: TablerIcons.car_crash,
                          //   incident: "Accident",
                          //   location: "Kottakkal",
                          //   time: "1 Hour",
                          //   context: context
                          // ),
                          // AlertWidgets.alertBox(
                          //   isEmergency: false,
                          //   color: LightColors.highPriority,
                          //   icon: TablerIcons.car_crash,
                          //   incident: "Accident",
                          //   location: "Kottakkal",
                          //   time: "1 Hour",
                          //   context: context
                          // )
                        ],
                      ),
                    ) : 
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 250,
                        child: Center(
                          child: Text("No Alerts!",style: AppTheme.h2Style,),
                        ),
                      ),
                    );
                  })
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
                    ButtonsWidgets.roundedButton(
                      onTap: () => reportAlert(context),
                      width: 350,
                      height: 69,
                      text: "Report An Alert"
                    )
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