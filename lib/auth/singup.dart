import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/controller/db_user_controller.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/models/user.dart';
import 'package:paltl/process_response.dart';
import 'package:paltl/weidget/text_field.dart';
class SigUp extends StatefulWidget {
  const SigUp({Key? key}) : super(key: key);

  @override
  State<SigUp> createState() => _SigUpState();
}

class _SigUpState extends State<SigUp> {
  late TextEditingController _mobileController;
  late TextEditingController _passController;
  late TextEditingController _confPasswordController;
  String? _mobileErorr = "";
  String?  _passErorr = "";
  String? _confPassErorr ="";

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _passController = TextEditingController();
    _confPasswordController = TextEditingController();
  }
  @override
  void dispose() {
    _mobileController.dispose();
    _passController.dispose();
    _confPasswordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              wieght: FontWeight.w400),
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
              wieght: FontWeight.w400),
          text_field(
            controller: _passController,
            keybord: TextInputType.number,
            obsecure: true,
            prefexIcon: Icons.remove_red_eye,
          ),
          SizedBox(
            height: 16.h,
          ),
          context.text(
              text: 'confpasss'.tr,
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400),
          text_field(
            controller: _confPasswordController,
            keybord: TextInputType.number,
            obsecure: true,
            prefexIcon: Icons.remove_red_eye,
          ),
          SizedBox(
            height: 24.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(327.w, 48.h),
                  primary: Color(context.blueColor)),
              onPressed: () {},
              child: context.text(
                  text: "login".tr, size: 14, color: context.wihteColor)),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              context.text(
                  text: 'loginmassage'.tr,
                  size: 14,
                  color: context.blackColor,
                  wieght: FontWeight.w400),
              TextButton(onPressed: () {}, child: Text('loginmassagetext'.tr))
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              context.text(
                  text: 'donthave'.tr,
                  size: 16,
                  color: context.blackColor,
                  wieght: FontWeight.w400),
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
      singUp();
    }
  }
  bool checkData(){
    if(_mobileController.text.isNotEmpty && _passController.text.isNotEmpty && _confPasswordController.text.isNotEmpty){
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
      _confPassErorr = _confPasswordController.text.isEmpty ? 'enterpass'.tr : null;
      if(_passController.text != _confPasswordController.text){
        context.snackBar(massage: "password dont match with Confirm Password");

      }
    });
  }
  Future<void> singUp()async{
    ProcessResponse processResponse =
        await DBUserController().register(user: user);
    if (processResponse.succsess) {
      Navigator.pop(context);
    }

    context.snackBar(massage:processResponse.massage,
     error: !processResponse.succsess);
  }

  User get user {
    User user = User();
    user.mobile = _mobileController.text;
    user.password = _passController.text;
    return user;
  }
}
