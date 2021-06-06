import 'package:details_frontend/interfaces/filters_interface.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class FiltersController extends GetxController {
  final filters = Rx<MainFilter>(MainFilter());
  final carBrand = Rx<SelectFilter>(SelectFilter());
  final carModel = Rx<AsyncSelectFilter>(AsyncSelectFilter(searchUrl: '/'));

  @override
  void onInit() {
    super.onInit();
    printInfo(info: 'onInitFiltefs');
  }
  void setCarBrand(String val) {
    this.carBrand.value.value = val;
  }

  void setCarModel(String val) {
    this.carModel.value.value = val;
  }

  // void setCarModel(String val) {
  //   this.filters.value.carModel = val;
  // }
  //
  // void setCarBodyType(String val) {
  //   this.filters.value.carBodyType = val;
  // }
  //
  // void setCarTransmissionType(String val) {
  //   this.filters.value.carTransmissionType = val;
  // }
  //
  // void setCarFuelType(String val) {
  //   this.filters.value.carFuelType = val;
  // }
  //
  // void setCarEngineVolume(String val) {
  //   this.filters.value.carEngineVolume = val;
  // }
  //
  // void setDetailType(String val) {
  //   this.filters.value.detailType = val;
  // }
}