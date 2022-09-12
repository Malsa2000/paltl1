import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/weidget/text_field.dart';
class VerficationCode extends StatefulWidget {
  const VerficationCode({Key? key}) : super(key: key);

  @override
  State<VerficationCode> createState() => _VerficationCodeState();
}

class _VerficationCodeState extends State<VerficationCode> {

  late TextEditingController _codeController ;

  @override
  void initState() {
    super.initState();
    _codeController =TextEditingController();
  }
  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("verification".tr),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 47.h,),
            Row(children: [
              context.text(text: "verficationmassage".tr, size: 14, color: context.blackColor),
              context.text(text: "+9165512", size: 14, color: context.blackColor),
            ],),
            SizedBox(height: 32.h,),
            context.text(text: "code".tr, size: 14, color: context.blackColor),
            SizedBox(height: 8.h,),
            text_field(controller: _codeController),
            SizedBox(height: 22.h,),
            ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: Size(327.w, 48.h) ,primary: Color(context.blueColor)),
                onPressed: (){},
                child: context.text(text: "verification".tr, size: 14, color: context.wihteColor))





          ],
        ),
      ),
    );
  }
}
