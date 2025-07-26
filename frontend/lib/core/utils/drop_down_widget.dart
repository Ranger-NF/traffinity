import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/providers/drop_down_provider.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  void _showDropdownMenu(DropDownProvider provider) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final selected = await showMenu<Map<String, dynamic>>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height,
        offset.dx + renderBox.size.width,
        offset.dy,
      ),
      items: provider.options!.map((option) {
        return PopupMenuItem<Map<String, dynamic>>(
          value: option,
          child: Row(
            children: [
              Icon(option['icon'], size: 20),
              SizedBox(width: 10),
              Text(option['label']),
            ],
          ),
        );
      }).toList(),
    );

    if (selected != null) {
      provider.selectOption(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DropDownProvider>(context);
    return InkWell(
      onTap: () => _showDropdownMenu(provider),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: LightColors.background,
          border: Border.all(width: 5, color: LightColors.black),
        ),
        width: 340,
        height: 71,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(provider.selectedIcon,size: 30,),
                SizedBox(width: 8),
                Text(
                  provider.selectedLabel,
                  style: AppTheme.h2Style,
                ),
              ],
            ),
            Icon(TablerIcons.chevron_down,size: 28,),
          ],
        ),
      ),
    );
  }
}