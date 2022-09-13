import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/controller/db_user_controller.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/models/user.dart';
import 'package:paltl/process_response.dart';
import 'package:paltl/weidget/text_field.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late TextEditingController _nameController;

  late TextEditingController _userIdController;

  late TextEditingController _telephonController;

  late TextEditingController _phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _userIdController = TextEditingController();
    _telephonController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _telephonController.dispose();
    _userIdController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("user Profile")),
        body: ListView(children: [
          CircleAvatar(
            radius: 40,
            child: Image(
              image: AssetImage("images/logo.png"),
            ),
          ),
          context.text(
              text: "Full Name",
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400,
              align: TextAlign.left),
          text_field(
            controller: _nameController,
            hint: "promassage2".tr,
          ),
          SizedBox(
            height: 16,
          ),
          context.text(
              text: "Phone Number".tr,
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400,
              align: TextAlign.left),
          text_field(
            controller: _phoneController,
            hint: "procity".tr,
          ),
          SizedBox(
            height: 16,
          ),
          context.text(
              text: "Id".tr,
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400,
              align: TextAlign.left),
          text_field(
            controller: _userIdController,
            hint: "description".tr,
          ),
          SizedBox(
            height: 16,
          ),
          context.text(
              text: "telePhone".tr,
              size: 14,
              color: context.blackColor,
              wieght: FontWeight.w400,
              align: TextAlign.left),
          text_field(
            controller: _telephonController,
            hint: "description".tr,
          ),
          SizedBox(
            height: 16,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            title: Text("chang Languges"),
            leading: Icon(Icons.language),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            title: Text("chang password"),
            leading: Icon(Icons.admin_panel_settings_sharp),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(87.w, 80.h), primary: Color(0xFFD8D8D8)),
                onPressed: () {
                  update();
                },
                child: Text("Update user Profile"),
              )),
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(87.w, 80.h), primary: Color(0xFFD8D8D8)),
                onPressed: () {},
                child: Text("cancel"),
              )),
            ],
          )
        ]));
  }

  Future<void> update() async {
    ProcessResponse processResponse = await DBUserController().update(user);
    if (processResponse.succsess) {
      context.snackBar(massage: "UpData Sucssesfly", error: false);
    }

    context.snackBar(
        massage: processResponse.massage, error: !processResponse.succsess);
  }

  User get user {
    User user = User();
    user.name = _nameController.text;
    user.mobile = _phoneController.text;
    user.telephone = _telephonController.text;
    user.userIdntfcation = _userIdController.text;
    return user;
  }
}
