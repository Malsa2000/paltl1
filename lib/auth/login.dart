import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/controller/db_user_controller.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/weidget/button.dart';
import 'package:paltl/weidget/text_field.dart';

import '../process_response.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _mobileController;
  late TextEditingController _passController;
  String? _mobileErorr = "";
  String?  _passErorr = "";

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _passController = TextEditingController();
  }
  @override
  void dispose() {
    _mobileController.dispose();
    _passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: 92.h,
          ),
          Image(
            image: AssetImage("images/logo.png"),
            height: 125.h,
            width: 107.w,
          ),
          SizedBox(
            height: 48.h,
          ),
          context.text(
              text: 'mobile'.tr,
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400 ,align: TextAlign.left),
          text_field(
            controller: _mobileController,
            keybord: TextInputType.number,
            obsecure: false,
          ),
          SizedBox(
            height: 16.h,
          ),
          context.text(
              text: 'pass'.tr,
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400 ,align: TextAlign.left),
          text_field(
            controller: _passController,
            keybord: TextInputType.number,
            obsecure: true,
            prefexIcon: Icons.remove_red_eye,
          ),
          SizedBox(
            height: 16.h,
          ),
          TextButton(
              onPressed: (){}, child: context.text(text: 'forgetpass'.tr, size: 16,
              color:(0xFF39B8FF) ,wieght: FontWeight.w500 ,align: TextAlign.left)),
          SizedBox(
            height: 24.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(327.w, 48.h),
                  primary: Color(context.blueColor)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/bot');
              },
              child: context.text(
                  text: "login".tr, size: 14, color: context.wihteColor)),
          SizedBox(
            height: 24.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.text(
                  text: 'donthave'.tr,
                  size: 16,
                  color: context.blackColor,
                  wieght: FontWeight.w400 ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'singup'.tr,
                    style: GoogleFonts.poppins(
                        color: Color(0xFF39B8FF), fontSize: 16),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  void performLogin(){
    if(checkData()){
      login();
    }
  }
  bool checkData(){
    if(_mobileController.text.isNotEmpty && _passController.text.isNotEmpty){
    context.snackBar(massage: "Log in Sccsessful");
      return true;
    }
    context.snackBar(massage: "Enter your Data");
    return false;
  }
  void checkTextFiled1() {
    setState(() {
      _mobileErorr = _mobileController.text.isEmpty ? 'entermobile'.tr : null;
      _passErorr = _passController.text.isEmpty ? 'enterpass'.tr : null;
    });
  }
  void login()async{
    ProcessResponse processResponse = await DBUserController().login(
        mobile: _mobileController.text, password: _passController.text);
    if (processResponse.succsess) {
      Navigator.pushReplacementNamed(context, '/AddProblem');
    }
    context.snackBar(massage: processResponse.massage ,
      error: !processResponse.succsess,
    );
  }}

