import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paltl/app/bouttom_navigation_bar.dart';
import 'package:paltl/app/lunch_screen.dart';
import 'package:paltl/app/onbording.dart';
import 'package:paltl/auth/login.dart';
import 'package:paltl/auth/singup.dart';
import 'package:paltl/auth/verfcation.dart';
import 'package:paltl/database/database_controller.dart';
import 'package:paltl/helper_classs.dart';
import 'package:paltl/local/local_controller.dart';
import 'package:paltl/prefs/shared_pref_controller.dart';
import 'package:paltl/provider/problem_provider.dart';
import 'package:paltl/user/add_problem.dart';
import 'package:paltl/user/problem_deials.dart';
import 'package:provider/provider.dart';
import 'local/local.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
//  await DataController().implementDatabase();
  await SharedPrefController().initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocaeController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
           // ChangeNotifierProvider<ProblemProvider>(create: (context) => ProblemProvider()),
          ],
          builder: (context, widget) {
            return GetMaterialApp(
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                      centerTitle: true,
                      backgroundColor:const Color(0xFFFFFFFF) ,
                      elevation: 0,
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w500
                      ))),
              locale: Get.deviceLocale,
              translations :MyLocale(),
              debugShowCheckedModeBanner: false,
              initialRoute: '/bot',
              routes: {
                '/onBording': (context) => const OnBording(),
                '/LunchScreen': (context) => const LunchScreen(),
                '/add_problem' :(context) => const AddProblem(),
                '/bot' :(context) => const NavigatorButtom(),
                '/problem_detiles' :(context) =>ProblemDeitals(),
                '/login' :(context) => Login(),
                '/sign_in' :(context) => SigUp(),
                '/veryfied_code': (context) => const VerficationCode(),

              },
            );
          },
        );
      },
    );

  }
}
