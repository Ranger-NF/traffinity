
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';

class AlertWidgets {
  static GestureDetector alertBox({
    required bool isEmergency,
    required BuildContext context,
    required String incident,
    required String location,
    required String time,
    required IconData icon,
    required Color color
  }){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/edit');
      },
      child: Container(
        width: 358,
        height: 68,
        decoration: BoxDecoration(
          color:  time.isNotEmpty ? isEmergency ? color.withOpacity(0.2) : color : color,
          border: BoxBorder.all(
            color: LightColors.black,
            width: AppTheme.borderWeight
          ),
        ),
        child: Expanded(
          flex: 2,
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(icon,size: 35,color: LightColors.black,),
              SizedBox(width: 15,),
              Text(incident,style: AppTheme.h3Style,),
              SizedBox(width: 10,),
              Text("●"),
              SizedBox(width: 10,),
              Text(location,style: TextStyle(fontSize: 24,decoration: TextDecoration.underline,color: LightColors.black),),
              SizedBox(width: 23,),
              Text(time,style: AppTheme.h6Style,),
              SizedBox(width: 0,),
              if(time.isNotEmpty) Icon(TablerIcons.chevron_right,size: 20,)
          ],
        ),
        )
      ),
    );
  }
}