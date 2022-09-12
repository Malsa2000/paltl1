import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  List color = <int>[
    (0xFFE3F1FF),
    (0xFFFFF6DB),
    (0xFFFFD9D9),
    (0xFFDDFFE2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
        ListTile(
          onTap: (){
            Navigator.pushNamed(context, '/problem_detiles');
          },
          title: context.text(text: "thefe", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          subtitle:context.text(text: "17/08/2022", size: 12, color: context.greyColor ,wieght: FontWeight.w400) ,
          trailing: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Color(color[2]),
                borderRadius: BorderRadius.circular(8.r)
            ),
            height: 28.h,
            width: 76.w,
            child:context.text(text: "ongoing".tr, size: 12, color: context.blackColor ,wieght: FontWeight.w400),

    ),
        ),
        ListTile(
          onTap: (){
            Navigator.pushNamed(context, '/problem_detiles');
          },
          title: context.text(text: "thefe telcommuncation from paltel", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          subtitle:context.text(text: "20/3/2022", size: 12, color: context.greyColor ,wieght: FontWeight.w400) ,
          trailing: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Color(color[3]),
                borderRadius: BorderRadius.circular(8.r)
            ),
            height: 28.h,
            width: 76.w,
            child:context.text(text: "ongoing".tr, size: 12, color: context.blackColor ,wieght: FontWeight.w400),

          ),
        )

      ],),
    );
  }
}
