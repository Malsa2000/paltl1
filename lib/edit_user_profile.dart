import 'package:flutter/material.dart';
class EditUserInfo extends StatefulWidget {
  const EditUserInfo({Key? key}) : super(key: key);

  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Edit Userr Profile'),),
    body: ListView(children: [

    ],),
    );

  }
}
