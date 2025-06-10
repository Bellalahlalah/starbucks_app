import 'package:get/get.dart';
import 'package:starbucks_app/localization/th_TH.dart' as th_th_lib;
import 'en_us.dart';
// ignore: unused_import
import 'th_th.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS,
        'th': th_th_lib.thTH,
      };
}
