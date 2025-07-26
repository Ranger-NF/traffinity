import 'package:flutter/material.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/core/utils/text_field_widgets.dart';
import 'package:frontend/core/utils/drop_down_widget.dart';
import 'package:frontend/models/report_model.dart';
import 'package:frontend/providers/drop_down_provider.dart';
import 'package:frontend/services/reports_services.dart';
import 'package:provider/provider.dart';

class AddAlertPage extends StatefulWidget {
  @override
  State<AddAlertPage> createState() => _StateAddAlertPage();
}

class _StateAddAlertPage extends State<AddAlertPage>{

  final TextEditingController locationCtrl = TextEditingController();
  final ReportsServices _service = ReportsServices();


  void onTapAddButton(DropDownProvider provider) async{
    ReportModel report = ReportModel(type: provider.selectedLabel, location: locationCtrl.text.trim());
    bool isSuccess = await _service.submitReport(report);
    if(isSuccess){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Report Submitted"))
      );
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed"))
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DropDownProvider>(context);
    return Scaffold(
      backgroundColor: LightColors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: AppTheme.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Alert",style: AppTheme.h1Style,),
                Text("Last Modified on 24 July-12 PM",style: AppTheme.h4Style,),
                SizedBox(height: 70,),
              
                // Options
                CustomDropdown(),
                SizedBox(height: 30,),


                TextFieldWidgets.locationField(
                  controller: locationCtrl
                ),
                SizedBox(height: 150,),

                Center(
                  child: ButtonsWidgets.roundedButton(
                    onTap: () => onTapAddButton(provider),
                    width: 258,
                    height: 69,
                    text: "Add Alert"
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}