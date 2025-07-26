import 'package:flutter/widgets.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsWidgets {
  static Future<void> _launchGoogleMaps(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Handle the case where Google Maps app or a browser cannot be launched
      throw 'Could not launch $url';
    }
  }

  static GestureDetector rectangularButton(){
    final String lat = '10.999565'; // Example latitude
    final String lng = '75.991666'; // Example longitude
    final String url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    return GestureDetector(
      onTap: (){
         _launchGoogleMaps(url);
      },
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

  static GestureDetector isEmergencyButton({
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
}

