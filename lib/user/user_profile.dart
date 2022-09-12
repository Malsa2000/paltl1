import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Icon(Icons.browser_updated ,size:15 , color: Color(context.blueColor),),
            TextButton(onPressed: (){}, child:context.text(text: 'Update', size: 14, color: context.blueColor ,wieght: FontWeight.w300)),
      ]),
        ListTile(
          title: context.text(text: 'name'.tr, size: 14, color: context.greyColor ,wieght: FontWeight.w300),
          subtitle:context.text(text: 'Malsa'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w400),
          leading: CircleAvatar(radius: 25,
            backgroundColor: Color(context.greyColor),
            child: Icon(Icons.person ,size: 24, color: Color(context.blueColor),),
          ),
        ),
        SizedBox(height: 15.h,),
        ListTile(
          title: context.text(text: 'mobilenumber'.tr, size: 14, color: context.greyColor ,wieght: FontWeight.w300),
          subtitle:context.text(text: '+0599165512'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w400),
          leading: CircleAvatar(radius: 25,
            backgroundColor: Color(0xFF9D97B1),
            child: Icon(Icons.call ,size: 24, color: Color(context.blueColor),),
          ),
        ),
        SizedBox(height: 15.h,),
        ListTile(
          title: context.text(text: 'email'.tr, size: 14, color: context.greyColor ,wieght: FontWeight.w300),
          subtitle:context.text(text: 'om11254@gamil.com'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w400),
          leading: CircleAvatar(radius: 25,
            backgroundColor: Color(0xFF9D97B1),
            child: Icon(Icons.email_rounded ,size: 24, color: Color(context.blueColor),),
          ),
        ),
        SizedBox(height: 15.h,),
        ListTile(
          title: context.text(text: 'address'.tr, size: 14, color: context.greyColor ,wieght: FontWeight.w300),
          subtitle:context.text(text: 'Gaza _AlNakheel street[205]'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w400),
          leading: CircleAvatar(radius: 25,
            backgroundColor: Color(0xFF9D97B1),
            child: Icon(Icons.location_on_rounded ,size: 24, color: Color(context.blueColor),),
          ),
        )

      ],),
    );
  }
}
