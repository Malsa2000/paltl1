import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/helper_classs.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2) ,(){
      Navigator.pushReplacementNamed(context, '/onBording');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        color: Color(context.wihteColor),
     alignment: Alignment.center,
     child:
      Image(image: AssetImage("images/logo.png"), height: 197.h, width: 169.w,)
      )
    );
  }
}
