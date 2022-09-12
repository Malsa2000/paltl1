import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
class ProblemDeitals extends StatelessWidget {
  const ProblemDeitals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
      appBar: AppBar(title: Text("reportdetails".tr),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          context.text(text: 'title Report'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
          SizedBox(height: 12,),
          context.text(text: "thef telcoomuncation from paltil", size: 14, color: context.greyColor ,wieght: FontWeight.w500 ),


          SizedBox(height: 16,),
          context.text(text: 'procity'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
          SizedBox(height: 12,),
          context.text(text: 'Gaza', size: 14, color: context.greyColor ,wieght: FontWeight.w500 ),

          SizedBox(height: 16,),
          context.text(text: 'description'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
          SizedBox(height: 12,),
          context.text(text: "one person go to lrfe the telcoounation from paltel", size: 14, color: context.greyColor ,wieght: FontWeight.w500 ),


          SizedBox(height: 16,),
          context.text(text: 'attachments'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
          Row(children: [
            Image(image: AssetImage('images/logo.png') ,height: 80.h, width: 87.w, fit: BoxFit.contain,),
            SizedBox(width: 5.w,),
            Image(image: AssetImage('images/logo.png') ,height: 80.h, width: 87.w, fit: BoxFit.contain,),

          ],),

          SizedBox(height: 16,),
          context.text(text: 'reportmode'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
          SizedBox(height: 12,),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Color(0xFFDDFFE2),
                borderRadius: BorderRadius.circular(8.r)
            ),
            height: 28.h,
            width: 76.w,
            child:context.text(text: "ongoing".tr, size: 12, color: context.blackColor ,wieght: FontWeight.w400),

          ),

        ],
      ),
    );
  }
}
