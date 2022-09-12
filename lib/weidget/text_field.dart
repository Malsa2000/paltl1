import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/helper_classs.dart';

class text_field extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? icon;

  final IconData? prefexIcon;
  final bool obsecure;
  final String  hint;
  final String? errorText1;
  final TextInputType? keybord;

  const text_field(
      {Key? key,
      required this.controller,
      this.obsecure = false,
      this.icon,
      this.hint ="",
        this.keybord,
      this.prefexIcon,
      this.errorText1})
      : super(key: key);

  @override
  State<text_field> createState() => _text_fieldState();
}

class _text_fieldState extends State<text_field> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecure,
      keyboardType: widget.keybord,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14 ,fontWeight: FontWeight.w300 ,color: Color(0xFFD8D8D8)),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {!widget.obsecure;});
            },
            constraints: BoxConstraints(
             minHeight: widget.errorText1 != null ? 42.h : 70.h,
            ),

            icon: Icon(widget.prefexIcon ,size: 20,),
            color: Color(context.greyColor)),

        filled: true,
        errorText: widget.errorText1,
        fillColor: Color(context.wihteColor),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Color(context.greyColor)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Color(context.blueColor), width: 1.0),
        ),
      ),
      enabled: true,
    );
  }
}
