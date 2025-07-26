import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';

class AlertWidgets {
  static GestureDetector alertBox({
    required VoidCallback onTap,
    required bool isEmergency,
    required BuildContext context,
    required String incident,
    required String location,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: time.isNotEmpty ? (isEmergency ? color.withOpacity(0.2) : color) : color,
          border: Border.all(
            color: LightColors.black,
            width: AppTheme.borderWeight,
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: LightColors.black),
              const SizedBox(width: 10),

              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        incident,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text("●"),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: LightColors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // Time and Chevron
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        time,
                        style: AppTheme.h6Style,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(TablerIcons.chevron_right, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
