import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class LocaeController extends GetxController{

  void changLanguges(String codeLangud){

    Locale locale = Locale(codeLangud);
    Get.updateLocale(locale);
  }
}