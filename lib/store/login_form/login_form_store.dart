import 'package:details_frontend/services/auth_service.dart';
import 'package:details_frontend/services/base_api_service.dart';
import 'package:details_frontend/store/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import 'package:details_frontend/store/error/error_store.dart';

part 'login_form_store.g.dart';

class LoginFormStore = _LoginFormStore with _$LoginFormStore;

abstract class _LoginFormStore with Store {

  final LoginFormErrorStore LoginformErrorStore = LoginFormErrorStore();
  final HomeStore _HomeStore = HomeStore();
  final ErrorStore errorStore = ErrorStore();

  final AuthService _AuthService = AuthService(BaseApi.sandbox());

  _LoginFormStore() {
    _setupValidations();
  }




  // disposers:-----------------------------------------------------------------
  List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !LoginformErrorStore.hasErrorsInLogin && userEmail.isNotEmpty && password.isNotEmpty;

  // @computed
  // bool get canRegister =>
  //     !LoginformErrorStore.hasErrorsInRegister &&
  //         userEmail.isNotEmpty &&
  //         password.isNotEmpty;
  //
  // @computed
  // bool get canForgetPassword =>
  //     !LoginformErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserEmail(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  // @action
  // void setConfirmPassword(String value) {
  //   confirmPassword = value;
  // }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      LoginformErrorStore.userEmailError = "Email can't be empty";
    } else {
      LoginformErrorStore.userEmailError = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      LoginformErrorStore.passwordError = "Password can't be empty";
    } else if (value.length < 6) {
      LoginformErrorStore.passwordError = "Password must be at-least 6 characters long";
    } else {
      LoginformErrorStore.passwordError = null;
    }
  }

  // @action
  // void validateConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     LoginformErrorStore.confirmPassword = "Confirm password can't be empty";
  //   } else if (value != password) {
  //     LoginformErrorStore.confirmPassword = "Password doen't match";
  //   } else {
  //     LoginformErrorStore.confirmPassword = null;
  //   }
  // }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future signIn() async {
    loading = true;

    var signInResult = await _AuthService.signIn(this.userEmail, this.password);
    Fluttertoast.showToast(
        msg: signInResult.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
  String userEmailError;

  @observable
  String passwordError;

  @computed
  bool get hasErrorsInLogin => userEmailError != null || passwordError != null;

  // @computed
  // bool get hasErrorsInRegister =>
  //     userEmail != null || password != null;

  @computed
  bool get hasErrorInForgotPassword => userEmailError != null;
}
