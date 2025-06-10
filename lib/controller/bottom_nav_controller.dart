import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.offAllNamed('/card');
        break;
      case 2:
        Get.offAllNamed('/order');
        break;
      case 3:
        Get.offAllNamed('/inbox');
        break;
      case 4:
        Get.offAllNamed('/account');
        break;
    }
  }
}
