import 'package:details_frontend/models/user/user.dart';
import 'package:get/get.dart';

class CoreController extends GetxController  {
  User currentUser;

  setCurrentUser(User user) {
    this.currentUser = user;
  }
}

