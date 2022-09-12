import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
extension ControllerHelp on BuildContext{

  void snackBar({required String massage , bool error =false}){
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(massage ,style: GoogleFonts.cairo(fontSize: 16 )),
        backgroundColor:error == true ? Color(0xFFEE3237) :Color(0xFFFBA808),
        elevation: 2,
        duration: Duration(seconds: 2),),
    );
  }

  int get wihteColor{
    return (0xFFFFFFFF);
  }
  int get greyColor{
    return (0xFF9D97B1);
  }
  int get yellowColor{
    return (0xFFFBA808);
  }
  int get blueColor{
    return (0xFF0082CA);
  }
  int get blackColor{
    return (0xFF01000D);
  }
  text( {required String text ,required double size , required int color ,FontWeight wieght = FontWeight.bold ,
    TextAlign align = TextAlign.left,}){
    return Text(
      text ,style :GoogleFonts.poppins(fontSize :size ,fontWeight: wieght ,
        color : Color(color) ,height: 1.1) ,textAlign: align,);
  }
}