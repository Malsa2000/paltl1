import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/local/local_controller.dart';
class ChangLanguges extends StatelessWidget {
   ChangLanguges({Key? key}) : super(key: key);

  bool _select = false;
  LocaeController controller = Get.find();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("lang".tr),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.text(text: 'languges'.tr, size: 23, color: context.blackColor ,wieght: FontWeight.w600),
            SizedBox(height: 5,),
            context.text(text: 'languges2'.tr, size: 18, color: context.yellowColor ,wieght: FontWeight.w500),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/paper.png") ,height: 30.h ,width: 50.w,),
                context.text(text: "اللغة العربية", size: 18, color: context.blackColor ,wieght: FontWeight.w400),
                SizedBox(width: 20,),
                ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(context.yellowColor) ,maximumSize: Size(100, 60)),
                    onPressed: (){
                      controller.changLanguges("ar");
                    }, child: Text('1'.tr)),
              ],),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/paper.png") ,height: 30.h ,width: 50.w,),
                context.text(text: "English", size: 18, color: context.blackColor ,wieght: FontWeight.w400),
                SizedBox(width: 20,),
                ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(context.yellowColor) ,maximumSize: Size(100, 60)),
                    onPressed: (){
                      controller.changLanguges("en");
                    }, child: Text('2'.tr)),

              ],),

          ],),

           // InkWell(
          //   onTap: (){
          //     controller.changLanguges("en");
          //   },
          //   child: Container(
          //     margin:EdgeInsets.symmetric(horizontal: 8.w ,vertical: 8),
          //     height:64.h, width: 327.w,
          //            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),
          //             color:_select ==true ? Color(0xFF0082CA) : Color(0xFFF3F3F3)),
          //            child: Row(children: [
          //              Image(image: AssetImage('images/english.png') ,height: 21, width: 21,),
          //              context.text(text: "English", size: 16, color: context.blackColor),
          //              Visibility(child: Icon(Icons.check ,
          //                color: Color(context.wihteColor),) ,visible: _select = true,)
          //            ],),),
          // ),
          // InkWell(
          //   onTap: (){
          //     controller.changLanguges("ar");
          //
          //   },
          //   child: Container(
          //     margin:EdgeInsets.symmetric(horizontal: 8.w ,vertical: 8),
          //     height:64.h, width: 327.w,
          //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),
          //         color:_select ==true ? Color(0xFF0082CA) : Color(0xFFF3F3F3)),
          //     child: Row(children: [
          //       Image(image: AssetImage('images/english.png') ,height: 21, width: 21,),
          //       context.text(text: "Arabic", size: 16, color: context.blackColor),
          //       Visibility(child: Icon(Icons.check ,
          //         color: Color(context.wihteColor),) ,visible: _select = true,)
          //     ],),),
          // ),
          // InkWell(
          //   onTap: (){
          //
          //   },
          //   child: Container(
          //     margin:EdgeInsets.symmetric(horizontal: 8.w ,vertical: 8),
          //     height:64.h, width: 327.w,
          //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),
          //         color:_select ==true ? Color(0xFF0082CA) : Color(0xFFF3F3F3)),
          //     child: Row(children: [
          //       Image(image: AssetImage('images/english.png') ,height: 21, width: 21,),
          //       context.text(text: "Fransh", size: 16, color: context.blackColor),
          //       Visibility(child: Icon(Icons.check ,
          //         color: Color(context.wihteColor),) ,visible: _select = true,)
          //     ],),),
          // ),


    );
  }
}
