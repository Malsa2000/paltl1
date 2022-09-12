import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/languges.dart';
import 'package:paltl/user/add_problem.dart';
import 'package:paltl/user/report.dart';

import '../user/user_profile.dart';


class NavigatorButtom extends StatefulWidget {
  const NavigatorButtom({Key? key}) : super(key: key);

  @override
  State<NavigatorButtom> createState() => _NavigatorButtomState();
}

class _NavigatorButtomState extends State<NavigatorButtom> {
    List<BnScreen> _screen = <BnScreen>[
    BnScreen(title: "home".tr, widget: AddProblem()),
     BnScreen(title: "report".tr, widget: Report()),
     BnScreen(title: "profile".tr, widget: ChangLanguges()),];
  int _currentPaeg = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screen[_currentPaeg].title)),
       // extendBodyBehindAppBar: true,
        body: _screen[_currentPaeg].widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(context.wihteColor),
            elevation: 5,
            onTap: (int cuttentPage) {
              setState(() => _currentPaeg = cuttentPage);
            },
            currentIndex: _currentPaeg,

            selectedIconTheme: IconThemeData(color: Color( context.blueColor) ),

            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold, color:Color( context.blueColor) ,fontSize: 12),
            unselectedIconTheme: IconThemeData(color: Color(0xFFD8D8D8)),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400, color:Color(0xFFD8D8D8), fontSize: 12),

            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined ,color: Color(0xFFD8D8D8) ,size: 20,),
                  activeIcon:Icon(Icons.home_outlined ,color: Color(context.blueColor) ,size: 20,) ,
                  label: "home".tr,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_rounded ,color: Color(0xFFD8D8D8) ,size: 20,),
                  activeIcon:  Icon(Icons.list_alt_rounded ,color: Color(context.blueColor) ,size: 20,),
                  label: "report".tr,
                ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined ,color: Color(0xFFD8D8D8) ,size: 20,),
                  activeIcon: Icon(Icons.person_outline_outlined ,color: Color(context.blueColor) ,size: 20,),
                  label: "profile".tr,
             ),
            ]),
    );
  }


}

class BnScreen {
  String title;
  Widget widget;

  BnScreen({required this.title,required this.widget});
}

