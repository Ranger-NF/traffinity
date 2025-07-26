import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/routing/app_route.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/providers/alert_show_provider.dart';
import 'package:frontend/providers/drop_down_provider.dart';
import 'package:frontend/providers/emergency_provider.dart';
import 'package:provider/provider.dart';

void main() {
  final List<Map<String, dynamic>> options = [
    {'label': 'Accident', 'icon': TablerIcons.car_crash},
    {'label': 'pothholes', 'icon': TablerIcons.traffic_cone},
    {'label': 'congestion', 'icon': TablerIcons.clock_hour_8},
  ];
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlertShowProvider()),
        ChangeNotifierProvider(create: (_) => EmergencyProvider()),
        ChangeNotifierProvider(create: (_) => DropDownProvider(options: options))
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bingo',
      theme: AppTheme.appTheme,
      routes: AppRoute.appRoute,
    );
  }
}


