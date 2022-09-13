import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/helper_classs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/state.dart';
class ProblemDetails extends StatefulWidget {
  const ProblemDetails({Key? key}) : super(key: key);

  @override
  State<ProblemDetails> createState() => _ProblemDetailsState();
}

class _ProblemDetailsState extends State<ProblemDetails> {

  String mobileNumber = "0";

  int? _id ;
  List<ReportState> _dropMenu = <ReportState>[
    ReportState(id: 1, title: "on-Going" ,color :(0xFFE3F1FF)),
    ReportState(id: 2, title: "Falsh report" ,color :(0xFFFFF6DB)),
    ReportState(id: 3, title: "Review" ,color :(0xFFFFD9D9)),
    ReportState(id: 4, title: "Report" ,color :(0xFFDDFFE2)),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: context.text(text: "Report Details", size: 20, color: context.blackColor)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          context.text(text: "Report's Provider Name", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
         container(name: "Malsa Badwan",),
          SizedBox(height: 16.h,),

          context.text(text: "Report's Provider Mobile Number", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          container(name: "0599165512",),
          SizedBox(height: 16.h,),

          context.text(text: "Report's Tile", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          container(name: "Problem",),
          SizedBox(height: 16.h,),

          context.text(text: "Neighborhode", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          container(name: "Gaza",),
          SizedBox(height: 16.h,),

          context.text(text: " Description", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          Container(
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 91.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: Color(context.wihteColor),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black45,
                blurRadius: 5)
          ],
        ),
        child:
        context.text(text: "Descroption", size: 20, color: context.greyColor),
      ),
          SizedBox(height: 16.h,),

          context.text(text: " Description", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          Image(image: AssetImage("images/notfound.png") ,height: 80.h, width: 87.w,),
          SizedBox(height: 16.h,),

          context.text(text: " Report State", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
          DropdownButton<int>(
              isExpanded: true,
              hint: const Text("pending"),
              style: GoogleFonts.poppins(fontSize: 20 ,fontWeight: FontWeight.w700 ,color: Colors.purple),
              value:_id ,
              onChanged: (int? vlaue) {
                setState(() => _id = vlaue);

              },
              items: _dropMenu
                  .map((ReportState) => DropdownMenuItem<int>(
                child: Text(ReportState.title),
                value:ReportState.id ,
              ))
                  .toList()),
          SizedBox(height: 16.h,),

          Row(children: [
            context.text(text: "Call Report's Provider", size: 14, color: context.blackColor ,wieght: FontWeight.w400),
            Spacer(),
            InkWell(
              onTap: (){
                mackCall();
              },
                child: Image(image: AssetImage("images/call.png") ,height: 21.h, width: 21.w,))
          ],),
          SizedBox(height: 33.h,),
          ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: Size(327.w, 48.h) ,primary: Color(context.blueColor)),
              onPressed: (){},
              child: context.text(text: "save", size: 14, color: context.wihteColor))
          ,SizedBox(height: 56.h,),



        ],


      ),
    );
  }

  mackCall()async{
      launch('tel://$mobileNumber');
      await FlutterPhoneDirectCaller.callNumber(mobileNumber);
  }
}

class container extends StatelessWidget {
 final String name ;
  const container({
    Key? key,
   required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 48.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: Color(context.wihteColor),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2),
              color: Colors.black45,
              blurRadius: 5)
        ],
      ),
      child:
    context.text(text: name, size: 20, color: context.greyColor),
       );
  }
}
