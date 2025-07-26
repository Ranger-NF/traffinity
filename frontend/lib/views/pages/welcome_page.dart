import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/views/widgets/welcome_widgets.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _StateWelcomePage();
}

class _StateWelcomePage extends State<WelcomePage>{

  void onTapNormalUser(BuildContext context){
    Navigator.pushNamed(context, '/alert');
  }

  void onTapEmergency(BuildContext context){
    Navigator.pushNamed(context, '/emergency_alert');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              padding: AppTheme.screenPadding,
              width: double.maxFinite,
              color: LightColors.primary,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("WELCOME",style: AppTheme.h1Style,),
                  Text("Select your role",style: AppTheme.h4Style,)
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 500,
              color: LightColors.background,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 150,),
                    WelcomeWidgets.welcomeButton(
                      icon: TablerIcons.user,
                      title: "Normal User",
                      onTap: () => onTapNormalUser(context)
                    ),
                    SizedBox(height: 30,),
                    WelcomeWidgets.welcomeButton(
                      icon: TablerIcons.activity_heartbeat,
                      title: "Emergency Service",
                      onTap: () => onTapEmergency(context)
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}