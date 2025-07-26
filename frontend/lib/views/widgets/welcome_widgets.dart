import 'package:flutter/widgets.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';

class WelcomeWidgets {

  static GestureDetector welcomeButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 330,
        height: 68,
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: LightColors.black,
            width: 5
          ),
          color: LightColors.tertiary
        ),
        child: Row(
          children: [
            SizedBox(width: 7,),
            Icon(icon,size: 28,),
            SizedBox(width: 10,),
            Text(title,style: AppTheme.h2Style,),
            title == "Normal User" ? SizedBox(width: 120,) : SizedBox(width: 46,),
            Icon(TablerIcons.chevron_right,size: 30,)
          ],
        ),
      ),
    );
  }
}