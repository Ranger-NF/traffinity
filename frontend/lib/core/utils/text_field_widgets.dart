import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';

class TextFieldWidgets {
  static Container locationField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 340,
      height: 71,
      decoration: BoxDecoration(
        color: LightColors.background,
        border: BoxBorder.all(
          color: LightColors.black,
          width: AppTheme.borderWeight
        )
      ),
      child: Row(
        children: [
          Icon(TablerIcons.location,size: 30,),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 30
              ),
              cursorColor: LightColors.black,
              cursorWidth: 4,
              cursorHeight: 45,
              decoration: InputDecoration(
                hintText: "Kottakkal",
                border: InputBorder.none,
              ),
            ),
          )
        ],
      )
    );
  }
}