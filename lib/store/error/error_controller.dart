import 'package:get/get.dart';

class ErrorController extends GetxController {
  var errorMessage = ''.obs;

  void setErrorMessage(String message) {
    this.errorMessage.value = message;
  }

  void reset(String value) {
    this.errorMessage.value = '';
  }
}