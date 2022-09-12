import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
class OnBording extends StatefulWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Expanded(
              child: PageView(
                onPageChanged: (int numberPage) {
                  setState(() => _currentPage = numberPage);
                },
                controller: _pageController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("images/on_bording1.png") ,height: 280.h,width: 370.w,),
                      SizedBox(height: 72.h,),
                      context.text(text: 'onbording1'.tr, size: 14, color: context.blackColor ,wieght: FontWeight.w500)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("images/on_bording2.png") ,height: 280.h,width: 370.w,),
                      SizedBox(height: 72.h,),
                      context.text(text: 'onbording2'.tr, size: 14, color: context.blackColor ,wieght: FontWeight.w500)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("images/on_bording3.png") ,height: 280.h,width: 370.w,),
                      SizedBox(height: 72.h,),
                      context.text(text: 'onbording3'.tr, size: 14, color: context.blackColor ,wieght: FontWeight.w500)
                    ],
                  ),
                ],
              )),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                  color: _currentPage == 0 ? Color(context.blueColor) : Color(0xFFE3F1FF),
                ),
                height: 6.h,
                width: _currentPage == 0 ? 18.w : 6.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                  color: _currentPage == 1 ? Color(context.blueColor) : Color(0xFFE3F1FF),
                ),
                height: 6.h,
                width: _currentPage == 1 ? 18.w : 6.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                margin: EdgeInsets.symmetric(horizontal: 4),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                       color: _currentPage == 2 ? Color(context.blueColor) : Color(0xFFE3F1FF),
                     ),
                height: 6.h,
                width: _currentPage == 2 ? 18.w : 6.w,
              ),

            ],
          ),
          SizedBox(height: 49.h,),

          ElevatedButton(style: ElevatedButton.styleFrom(
              minimumSize: Size(327.w, 48.h) ,primary: Color(context.blueColor) ,padding: EdgeInsets.symmetric(
                     vertical: 15.h ,

          )),
              onPressed: (){
            Navigator.pushReplacementNamed(context, '/login');
              },
              child: context.text(text: "getstart".tr, size: 14, color: context.wihteColor ,wieght: FontWeight.w300)),
               SizedBox(height: 50.h,)
        ],
      ),
    ),
    );
  }
}
