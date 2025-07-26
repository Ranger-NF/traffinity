import 'package:flutter/widgets.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';

class ButtonsWidgets {

  static GestureDetector rectangularButton(){
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: LightColors.primary,
          boxShadow: [
            AppTheme.shadow
          ]
        ),
        width: 342,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text("Find Best Route",style: AppTheme.h2Style),
            Icon(TablerIcons.external_link,color: LightColors.black,size: 30,)
          ],
        ),
      ),
    );
  }

  static GestureDetector roundedButton({
    required double width,
    required double height,
    required String text,
    required VoidCallback onTap
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            AppTheme.shadow
          ],
          color: LightColors.mediumPriority,
          border: BoxBorder.all(
            color: LightColors.black,
            width: AppTheme.borderWeight
          ),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: AppTheme.h2Style,),
            SizedBox(width: 10,),
            Icon(TablerIcons.speakerphone,color: LightColors.black,size: 30,)
          ],
        ),
      ),
    );
  }


  static GestureDetector isNotEmergencyButton({
    required VoidCallback onTap
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 307,
        height: 60,
        decoration: BoxDecoration(
          color: LightColors.highPriority,
          border: BoxBorder.all(width: AppTheme.borderWeight,color: LightColors.black),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text("Emergency",style: AppTheme.h2Style,),
        ),
      ),
    );
  }

  static GestureDetector isEmergencyButton({
    required VoidCallback onTap
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 307,
        height: 60,
        decoration: BoxDecoration(
          border: BoxBorder.all(width: AppTheme.borderWeight,color: LightColors.highPriority),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(
            "Emergency",
            style: TextStyle(
              color: LightColors.highPriority,
              fontSize: 28
            ),
          ),
        ),
      ),
    );
  }
}