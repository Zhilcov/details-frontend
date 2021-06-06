import 'package:details_frontend/services/auth_service.dart';
import 'package:details_frontend/services/base_api_service.dart';
import 'package:details_frontend/store/core/core_controller.dart';
import 'package:details_frontend/utils/device/toaster.dart';
import 'package:get/get.dart';


class LoginFormController extends GetxController {
  final AuthService _AuthService = AuthService(BaseApi.sandbox());
  LoginFormErrorController loginFormError = Get.put<LoginFormErrorController>(LoginFormErrorController());
  CoreController coreController =  Get.find<CoreController>();

  final userLogin = Rx<String>('');

  final password = Rx<String>('');

  final success = Rx<bool>(false);

  final loading = Rx<bool>(false);

  void setUserLogin(String value) {
    userLogin.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  @override
  void onInit() {
    ever(userLogin, (val) => validateUserEmail(val.toString()));
    ever(password, (val) => validatePassword(val.toString()));
  }

  bool get canLogin =>
      !loginFormError.hasErrorsInLogin && userLogin.isNotEmpty && password.isNotEmpty;

  void validateUserEmail(String value) {
    if (value.isEmpty) {
      loginFormError.userEmailError.value = "Email can't be empty";
    } else {
      loginFormError.userEmailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      loginFormError.passwordError.value = "Password can't be empty";
    } else if (value.length < 6) {
      loginFormError.passwordError.value = "Password must be at-least 6 characters long";
    } else {
      loginFormError.passwordError.value = '';
    }
  }

  Future signIn() async {
    loading.value = true;

    var signInResult = await _AuthService.signIn(this.userLogin.value, this.password.value);

    if (signInResult.success) {
      Toaster.show('Авторизация прошла успешно');
      coreController.setCurrentUser(signInResult.data);
    } else {
      Toaster.showError(signInResult.message);
    }

    loading.value = false;
  }
}

class LoginFormErrorController extends GetxController {
  var userEmailError = ''.obs;
  var passwordError = ''.obs;

  bool get hasErrorsInLogin => userEmailError.value != null || passwordError.value != null;
}

