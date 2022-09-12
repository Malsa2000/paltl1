import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/models/state.dart';
import 'package:paltl/provider/problem_provider.dart';
import 'package:provider/provider.dart';

import '../models/problem.dart';
class ViewProblem extends StatefulWidget {
  const ViewProblem({Key? key}) : super(key: key);

  @override
  State<ViewProblem> createState() => _ViewProblemState();
}

class _ViewProblemState extends State<ViewProblem> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> state = <String>[
     "pending".tr ,
     "ongoing".tr ,
    "falsereport".tr,
    "review".tr

  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Provider.of<ProblemProvider>(context, listen: false).readState("pending".tr);

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
              setState(() {
                _tabController.index = index;
                Provider.of<ProblemProvider>(context, listen: false).readState(state[index]);

              });
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
              context.text(text:state[0], size: 12, color: context.blackColor ,wieght :FontWeight.w400),
              context.text(text: state[1], size: 12, color: context.blackColor ,wieght :FontWeight.w400),
              context.text(text: state[2], size: 12, color: context.blackColor ,wieght :FontWeight.w400),
              context.text(text: state[3], size: 12, color: context.blackColor ,wieght :FontWeight.w400),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [

                list_state(tabController: _tabController ,index :_tabController.index),
                list_state(tabController: _tabController ,index :_tabController.index),
                list_state(tabController: _tabController ,index :_tabController.index),
                list_state(tabController: _tabController ,index :_tabController.index),

              ],
            ),
          )

        ],
      ),
    );
  }
}

class list_state extends StatelessWidget {
 final int index;
  const list_state({
    required this.index,
    Key? key,
    required TabController tabController,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
  return  Consumer<ProblemProvider>(
      builder: (context, ProblemProvider value, child) {
        if (value.Problems.isNotEmpty) {
          return ListView.builder(
            itemCount: value.Problems.length,
            itemBuilder: (context, index) {
              return Visibility(
                visible: _tabController.index == 0,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                          children :[
                            ListTile(
                              title: context.text(text: value.Problems[index].titileProblem, size: 14, color: context.blackColor ,wieght: FontWeight.w400),
                              leading:context.text(text: value.Problems[index].date, size: 12, color: context.greyColor ,wieght: FontWeight.w400),
                            ),
                            Divider(height: 3, color: Color(context.greyColor),),
                          ]
                      );
                    }),
              );
            },
          );
        }
        else {
          return Center(
            child: Text(
              'NO DATA',
              style: GoogleFonts.cairo(
                fontSize: 24,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );



  }
}
