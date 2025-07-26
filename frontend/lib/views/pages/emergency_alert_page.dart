import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/providers/alert_show_provider.dart';
import 'package:frontend/providers/emergency_provider.dart';
import 'package:frontend/views/widgets/alert_widgets.dart';
import 'package:provider/provider.dart';

class EmergencyAlertPage extends StatefulWidget {
  @override
  State<EmergencyAlertPage> createState() => _StateEmergencyAlertPage();
}

class _StateEmergencyAlertPage extends State<EmergencyAlertPage>{
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
                  Text("Friday",style: AppTheme.h6Style,),
                  Text("Alerts!",style: AppTheme.h1Style,),
                  alertShowProvider.isAlert ? Container(
                      child: Column(
                        spacing: 15,
                        children: [
                          SizedBox(height: 10,),
                          if(emergencyProvider.isEmergency) AlertWidgets.alertBox(
                            isEmergency: emergencyProvider.isEmergency,
                            context: context,
                            icon: TablerIcons.activity_heartbeat,
                            incident: "Make Way",
                            location: "Emergency",
                            time: "",
                            color: LightColors.highPriority
                          ),
                          AlertWidgets.alertBox(
                            isEmergency: emergencyProvider.isEmergency,
                            color: LightColors.highPriority,
                            icon: TablerIcons.car_crash,
                            incident: "Accident",
                            location: "Kottakkal",
                            time: "1 Hour",
                            context: context
                          ),
                          AlertWidgets.alertBox(
                            isEmergency: emergencyProvider.isEmergency,
                            color: LightColors.highPriority,
                            icon: TablerIcons.car_crash,
                            incident: "Accident",
                            location: "Kottakkal",
                            time: "1 Hour",
                            context: context
                          ),
                          AlertWidgets.alertBox(
                            isEmergency: emergencyProvider.isEmergency,
                            color: LightColors.highPriority,
                            icon: TablerIcons.car_crash,
                            incident: "Accident",
                            location: "Kottakkal",
                            time: "1 Hour",
                            context: context
                          )
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