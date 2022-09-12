import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/models/problem.dart';
import 'package:paltl/prefs/shared_pref_controller.dart';
import 'package:paltl/process_response.dart';
import 'package:paltl/provider/problem_provider.dart';
import 'package:paltl/weidget/button.dart';
import 'package:paltl/weidget/text_field.dart';
import 'package:provider/provider.dart';
class AddProblem extends StatefulWidget {
  const AddProblem({Key? key}) : super(key: key);

  @override
  State<AddProblem> createState() => _AddProblemState();
}

class _AddProblemState extends State<AddProblem> {

 late TextEditingController _titleController ;
 late TextEditingController _cityController ;
 late TextEditingController _descriptionController ;

 String? _titleErorr;
 String? _descriptionErorr;
 String? _cityErorr;

String? userImage;
File? _images;
final imagePicker = ImagePicker();


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _cityController = TextEditingController();
    _descriptionController = TextEditingController();

 }
@override
  void dispose() {
  _titleController.dispose();
  _cityController.dispose();
  _descriptionController.dispose();

  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
    //  appBar: AppBar(title: Text(""),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          context.text(text: "welcom".tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ,align: TextAlign.left),
          context.text(text: "mohammed", size: 12, color: context.greyColor ,wieght: FontWeight.w400 ,align: TextAlign.left),
          SizedBox(height: 12,),
          context.text(text: "promassages".tr, size: 14, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.left),
          SizedBox(height: 24,),

          context.text(text: "promassage2".tr, size: 14, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.left),
          text_field(controller: _titleController ,hint: "promassage2".tr,),
          SizedBox(height: 16,),

          context.text(text: "procity".tr, size: 14, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.left),
          text_field(controller: _cityController ,hint: "procity".tr,),
          SizedBox(height: 16,),

          context.text(text: "description".tr, size: 14, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.left),
          text_field(controller: _descriptionController ,hint: "description".tr,),
          SizedBox(height: 16,),

          context.text(text: "photo".tr, size: 14, color: context.blackColor ,wieght: FontWeight.w400 ,align: TextAlign.left),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(87.w, 80.h),
            primary: Color(0xFFD8D8D8)),
        onPressed: () {
          showDailalogImage(context);
        },
        child:Icon(Icons.image ,color: Color(context.wihteColor), size: 32,) ),
          SizedBox(height: 16,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(327.w, 48.h),
                  primary: Color(context.blueColor)),
              onPressed: () {
                String title = _titleController.text;
                String city = _cityController.text;

                _showList(context ,title ,city);
              },
              child: context.text(
                  text: 'send'.tr, size: 14, color: context.wihteColor ,align: TextAlign.left))
          ,SizedBox(height: 20,),
        ],
      ),
    );
  }
  void _showList(BuildContext context, String title ,String city ) async{
    await showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context,
            void Function(void Function()) setState) {

          return BottomSheet(
              clipBehavior: Clip.antiAlias,
              backgroundColor: Color(context.wihteColor),
              onClosing: () {},
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(color: Color(context.wihteColor) , borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  )),
                  padding: EdgeInsets.symmetric(horizontal: 16 ,vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      context.text(text: 'confermproblem'.tr, size: 18, color: context.blackColor ,wieght: FontWeight.w500 )
                      ,SizedBox(height: 16,),
                       Divider(height: 1),
                      context.text(text: 'title'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
                      context.text(text: title, size: 14, color: context.greyColor ,wieght: FontWeight.w500 ),
                      SizedBox(height: 16,),
                      context.text(text: 'procity'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
                      context.text(text: city.tr, size: 14, color: context.greyColor ,wieght: FontWeight.w500 ),

                      SizedBox(height: 16,),
                      context.text(text: 'attachments'.tr, size: 16, color: context.blackColor ,wieght: FontWeight.w500 ),
                      context.text(text: 'no attachments'.tr, size: 14, color: context.greyColor ,wieght: FontWeight.w500 ),

                      SizedBox(height: 24,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(327.w, 48.h),
                              primary: Color(context.blueColor)),
                          onPressed: () {
                            //test
                            print("malsa");

                         performAddProblem();
                         Navigator.pop(context);
                         showDailalog(context);
                          },
                          child: context.text(
                              text: 'confirm'.tr, size: 14, color: context.wihteColor ))
                      ,SizedBox(height: 7,),


                    ],
                  ),
                );
              });
        },
      );
    });

  }
  Future showDailalog(BuildContext context){
   return showDialog(context: context, builder: (context)=> AlertDialog(
     content: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
       Image(image: AssetImage("images/true.png") ,height: 100.h, width: 100.w,),
       SizedBox(height: 32.h,),
       context.text(text: "dalog".tr, size: 18, color: context.blackColor ,wieght: FontWeight.w400),
       SizedBox(height: 32.h,),
       ElevatedButton(
           style: ElevatedButton.styleFrom(
               minimumSize: Size(327.w, 48.h),
               primary: Color(context.blueColor)),
           onPressed: () {
             Navigator.pop(context);
             Navigator.pushReplacementNamed(context, '/bot');
           },
           child: context.text(
               text: "gohome".tr, size: 14, color: context.wihteColor)),
       SizedBox(height: 32.h,),

     ],),
   ));
   
}
 Future showDailalogImage(BuildContext context){
   return showDialog(context: context, builder: (context)=> AlertDialog(
     content: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         context.text(text: "Select", size: 18, color: context.blackColor ,wieght: FontWeight.w400),
         SizedBox(height: 32.h,),
         Row(children: [
           ElevatedButton(
               style: ElevatedButton.styleFrom(
                   minimumSize: Size(327.w, 48.h),
                   primary: Color(context.blueColor)),
               onPressed: () {
                 Navigator.pop(context);
                 getImage( ImageSource.gallery);
               },
               child: context.text(
                   text: "From Galary", size: 14, color: context.wihteColor)),
           ElevatedButton(
               style: ElevatedButton.styleFrom(
                   minimumSize: Size(327.w, 48.h),
                   primary: Color(context.blueColor)),
               onPressed: () {
                 Navigator.pop(context);
                 getImage( ImageSource.camera);
               },
               child: context.text(
                   text: "From Camera", size: 14, color: context.wihteColor)),

         ],),
         SizedBox(height: 32.h,),

       ],),
   ));

 }


  Future getImage(ImageSource image)async{
   print("malsa");
   final imageFile = await imagePicker.getImage(source: image);
   if(imageFile != null){
     setState(()=> _images = File(imageFile.path));
     print(imageFile.path);
   }
 }


 performAddProblem(){
   if(checkData()){
     save();
   }
 }

 bool checkData(){
   if(_descriptionController.text.isNotEmpty && _cityController.text.isNotEmpty && _titleController.text.isNotEmpty
   ){
     return true;
   }
   context.snackBar(massage: "all fileds is requerd" ,error: true);
   return false;
 }

void save(){
  Provider.of<ProblemProvider>(context, listen: false)
      .create(problem);
  context.snackBar(
      massage: "Add Success!" , error: false);
}


 Problem get problem {
   Problem problem = Problem();
   problem.titileProblem = _titleController.text;
   problem.description = _descriptionController.text;
   problem.city = _cityController.text;
   problem.state = 'wating';
   problem.date = date as String;
   problem.userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;
   return problem;
 }

void clear(){
  _titleController.clear();
  _descriptionController.clear();
  _cityController.clear();
}
DateTime get date{
   var now = DateTime.now();
  return  now;
}

}
