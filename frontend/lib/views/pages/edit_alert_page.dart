import 'package:flutter/material.dart';
import 'package:frontend/controllers/report_controller.dart';
import 'package:frontend/core/colors/light_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/utils/buttons_widgets.dart';
import 'package:frontend/core/utils/drop_down_widget.dart';
import 'package:frontend/core/utils/text_field_widgets.dart';
import 'package:frontend/models/report_model.dart';
import 'package:frontend/providers/drop_down_provider.dart';
import 'package:frontend/services/reports_services.dart';
import 'package:provider/provider.dart';

class EditAlertPage extends StatefulWidget {
  @override
  State<EditAlertPage> createState() => _StateEditAlertPage();
}

class _StateEditAlertPage extends State<EditAlertPage>{

  final TextEditingController locationCtrl = TextEditingController();
  final ReportsServices _service = ReportsServices();
  final ReportController _controller = ReportController();
   
  void onTapEditButton(DropDownProvider provider) async{
    final id =  await _controller.getTheId();
    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ID not found")),
      );
      return;
    } 
    ReportModelId report = 
    ReportModelId(
      id: id ,
      type: provider.selectedLabel, 
      location: locationCtrl.text.trim()
    );
    bool isSuccess = await _service.updateReport(report);
    if(isSuccess){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Report Update Submitted"))
      );
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed"))
      );
    }
    Navigator.pop(context);
  } 

  void onTapResolveButton() async{
    final id = await _controller.getTheId();
    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ID not found")),
      );
      return;
    } 
    bool isSuccess = await _service.resolveReport(id);
    if(isSuccess){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Report Resolved"))
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
                Text("Edit Alert",style: AppTheme.h1Style,),
                Text("Last Modified on 24 July-12 PM",style: AppTheme.h4Style,),
                SizedBox(height: 70,),
              
                // Options
                CustomDropdown(),
                SizedBox(height: 30,),
                TextFieldWidgets.locationField(controller: locationCtrl),
                SizedBox(height: 70,),

                Center(
                  child: ButtonsWidgets.roundedButton(
                    onTap: () => onTapEditButton(provider),
                    width: 258,
                    height: 69,
                    text: "Edit Alert"
                  ),
                ),
                SizedBox(height: 30,),

                // Resolve Button
                Center(
                  child: GestureDetector(
                    onTap: () => onTapResolveButton(),
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