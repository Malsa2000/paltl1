import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/helper_classs.dart';

import '../models/problem.dart';
class ViewProblem extends StatefulWidget {
  const ViewProblem({Key? key}) : super(key: key);

  @override
  State<ViewProblem> createState() => _ViewProblemState();
}

class _ViewProblemState extends State<ViewProblem> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: 60.h,),
          context.text(text: "hello".tr, size: 16, color: context.blackColor ,wieght: FontWeight.w600),
          context.text(text: "Mohammed", size: 12, color: context.greyColor ,wieght: FontWeight.w400),
          SizedBox(height: 14.h,),
          context.text(text: "report".tr, size: 18, color: context.blackColor ,wieght: FontWeight.w500),

          TabBar(
            onTap: (int index) {
              setState(() => _tabController.index = index);
            },
            indicator: BoxDecoration(
                color: Color(context.blueColor),
                borderRadius: BorderRadius.circular(8.r),
            ),
            labelColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 9 ,horizontal: 19),
            unselectedLabelColor: Color(context.greyColor),
            controller: _tabController,
            tabs:  [
              context.text(text: "pending".tr, size: 12, color: context.blackColor ,wieght :FontWeight.w400),
              context.text(text: "ongoing".tr, size: 12, color: context.blackColor ,wieght :FontWeight.w400),
              context.text(text: "falsereport".tr, size: 12, color: context.blackColor ,wieght :FontWeight.w400),
              context.text(text: "review".tr, size: 12, color: context.blackColor ,wieght :FontWeight.w400),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [

                Visibility(
                  visible: _tabController.index == 0,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children :[
                            ListTile(
                              title: context.text(text: "peoblem", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
                              leading:context.text(text: "data", size: 12, color: context.greyColor ,wieght: FontWeight.w400),
                            ),
                            Divider(height: 3, color: Color(context.greyColor),),
                          ]
                        );
                      }),
                ),
                Visibility(
                  visible: _tabController.index == 0,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                            children :[
                              ListTile(
                                title: context.text(text: "peoblem", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
                                leading:context.text(text: "data", size: 12, color: context.greyColor ,wieght: FontWeight.w400),
                              ),
                              Divider(height: 3, color: Color(context.greyColor),),
                            ]
                        );
                      }),
                ),
                Visibility(
                  visible: _tabController.index == 0,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                            children :[
                              ListTile(
                                title: context.text(text: "peoblem", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
                                leading:context.text(text: "data", size: 12, color: context.greyColor ,wieght: FontWeight.w400),
                              ),
                              Divider(height: 3, color: Color(context.greyColor),),
                            ]
                        );
                      }),
                ),
                Visibility(
                  visible: _tabController.index == 0,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                            children :[
                              ListTile(
                                title: context.text(text: "peoblem", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
                                leading:context.text(text: "data", size: 12, color: context.greyColor ,wieght: FontWeight.w400),
                              ),
                              Divider(height: 3, color: Color(context.greyColor),),
                            ]
                        );
                      }),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
