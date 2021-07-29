import 'package:details_frontend/store/core/core_controller.dart';
import 'package:details_frontend/store/login_form/login_form_controller.dart';
import 'package:get/get.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginFormController>(() => LoginFormController());
    Get.lazyPut<CoreController>(() => CoreController());
  }
}