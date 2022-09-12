import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/provider/problem_provider.dart';
import 'package:provider/provider.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProblemProvider>(context, listen: false).read();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
      body: Consumer<ProblemProvider>(
        builder: (context, ProblemProvider value, child) {
          if (value.Problems.isNotEmpty) {
            return ListView.builder(
                itemCount: value.Problems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/problem_detiles');
                    },
                    title: context.text(text: value.Problems[index].titileProblem,
                        size: 14,
                        color: context.blackColor,
                        wieght: FontWeight.w400),
                    subtitle: context.text(text: value.Problems[index].date,
                        size: 12,
                        color: context.greyColor,
                        wieght: FontWeight.w400),
                    trailing: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          borderRadius: BorderRadius.circular(8.r)
                      ),
                      height: 28.h,
                      width: 76.w,
                      child: context.text(text: value.Problems[index].state,
                          size: 12,
                          color: context.blackColor,
                          wieght: FontWeight.w400),

                    ),
                  );
                }
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        })
    );
  }
}
