import 'package:details_frontend/models/user/user.dart';
import 'package:details_frontend/navigation/paths_list_enum.dart';
import 'package:get/get.dart';

class CoreController extends GetxController  {
  late User currentUser;

  setCurrentUser(User user) {
    if (user == null) {
      Get.offAllNamed(Paths.loginPage);
    } else {
      Get.offAllNamed(Paths.mainPage);
    }
    this.currentUser = user;
  }
}

