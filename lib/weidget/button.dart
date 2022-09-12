import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paltl/helper_classs.dart';

class button extends StatelessWidget {
  final String title;
  const button({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(327.w, 48.h),
            primary: Color(context.blueColor)),
        onPressed: () {},
        child: context.text(
            text: title, size: 14, color: context.wihteColor));
  }
}
