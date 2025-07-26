import 'package:flutter/material.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/core/utils/drop_down_widget.dart';
import 'package:frontend/core/utils/text_field_widgets.dart';

class EditAlertPage extends StatefulWidget {
  @override
  State<EditAlertPage> createState() => _StateEditAlertPage();
}

class _StateEditAlertPage extends State<EditAlertPage>{
   
  void onTapEditButton(){
    Navigator.pop(context);
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: AppTheme.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Edit Alert",style: AppTheme.h1Style,),
                Text("Last Modified on 24 July-12 PM",style: AppTheme.h4Style,),
                SizedBox(height: 70,),
              
                // Options
                CustomDropdown(),
                SizedBox(height: 30,),
                TextFieldWidgets.locationField(),
                SizedBox(height: 70,),

                Center(
                  child: ButtonsWidgets.roundedButton(
                    onTap: () => onTapEditButton(),
                    width: 258,
                    height: 69,
                    text: "Edit Alert"
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: 258,
                      height: 69,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(
                          width: AppTheme.borderWeight,
                          color: LightColors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text("Mark as Resolved",style: AppTheme.h2Style,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}