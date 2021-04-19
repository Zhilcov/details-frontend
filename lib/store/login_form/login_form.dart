import 'package:validators/validators.dart';
import 'package:mobx/mobx.dart';

import 'package:details_frontend/store/error/error_store.dart';

part 'login_form.g.dart';

class LoginFormStore = _LoginFormStore with _$LoginFormStore;

abstract class _LoginFormStore with Store {
  // store for handling Loginform errors
  final LoginFormErrorStore LoginformErrorStore = LoginFormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _LoginFormStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !LoginformErrorStore.hasErrorsInLogin && userEmail.isNotEmpty && password.isNotEmpty;

  @computed
  bool get canRegister =>
      !LoginformErrorStore.hasErrorsInRegister &&
          userEmail.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !LoginformErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      LoginformErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      LoginformErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      LoginformErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      LoginformErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      LoginformErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      LoginformErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      LoginformErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      LoginformErrorStore.confirmPassword = "Password doen't match";
    } else {
      LoginformErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future login() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
  }
}

class LoginFormErrorStore = _LoginFormErrorStore with _$LoginFormErrorStore;

abstract class _LoginFormErrorStore with Store {
  @observable
  String userEmail;

  @observable
  String password;

  @observable
  String confirmPassword;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
