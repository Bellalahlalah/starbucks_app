import 'package:get/get.dart';
import '../models/user.dart';

class UserService extends GetxService {
  Rxn<User> currentUser = Rxn<User>();

  bool get isLoggedIn => currentUser.value != null;

  void login(User user) {
    currentUser.value = user;
  }

  void logout() {
    currentUser.value = null;
  }
}
