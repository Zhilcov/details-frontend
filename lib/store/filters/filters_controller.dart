import 'package:details_frontend/interfaces/filters_interface.dart';
import 'package:details_frontend/services/base_api_service.dart';
import 'package:details_frontend/services/car_brand_api_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class FiltersController extends GetxController {
  final CarBrandApiService _CarBrandApi = new CarBrandApiService();
  final filters = Rx<MainFilter>(MainFilter());
  final carBrand = Rx<SelectFilter>(SelectFilter(value: '23', options: []));
  final carModel = Rx<AsyncSelectFilter>(AsyncSelectFilter(searchUrl: '/'));

  @override
  void onInit() {
    super.onInit();
    this.getCarBrandsList();
    printInfo(info: 'onInitFiltefs');
  }
  void setCarBrand(String val) {
    this.carBrand.value.value = val;
  }

  void getCarBrandsList() async {
    var res = await this._CarBrandApi.getBrandsList();
    this.carBrand.value = SelectFilter(value: '23', options: res.data);
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