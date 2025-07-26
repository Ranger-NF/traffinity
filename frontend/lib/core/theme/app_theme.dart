import 'package:flutter/material.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: LightColors.background,
    fontFamily: GoogleFonts.anton().fontFamily,
    brightness: Brightness.light,
    shadowColor: LightColors.shadowColor,
    useMaterial3: true,
  );

  static BoxShadow shadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 4,
    color: LightColors.shadowColor
  );

  // Text Styles
  static TextStyle h1Style = TextStyle(fontSize: 36);
  static TextStyle h2Style = TextStyle(fontSize: 28);
  static TextStyle h3Style = TextStyle(fontSize: 24);
  static TextStyle h4Style = TextStyle(fontSize: 18);
  static TextStyle h6Style = TextStyle(fontSize: 12);

  static double borderWeight = 5;

  // Screen Padding
  static EdgeInsets screenPadding = EdgeInsets.symmetric(vertical: 37,horizontal: 14);
  

}