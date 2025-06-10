import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  var languageCode = 'en'.obs;

  void setLanguage(String code) {
    languageCode.value = code;
    Get.updateLocale(Locale(code));
  }
}
