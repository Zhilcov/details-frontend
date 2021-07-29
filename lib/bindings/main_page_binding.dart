import 'package:details_frontend/bindings/core_binding.dart';
import 'package:details_frontend/store/filters/filters_controller.dart';
import 'package:get/get.dart';

class MainPageBinding extends CoreBindings {

  void dependencies() {
    super.dependencies();
    Get.lazyPut<FiltersController>(() => FiltersController());
  }
}