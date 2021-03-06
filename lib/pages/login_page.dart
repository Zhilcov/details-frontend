import 'package:details_frontend/components/ui/app_icon.dart';
import 'package:details_frontend/components/ui/empty_app_bar.dart';
import 'package:details_frontend/components/ui/rounded_button.dart';
import 'package:details_frontend/components/ui/text_field.dart';
import 'package:details_frontend/store/login_form/login_form_controller.dart';
import 'package:details_frontend/utils/device/device_utils.dart';
import 'package:details_frontend/utils/device/toaster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late final FocusNode _passwordFocusNode;

  final _store = Get.find<LoginFormController>();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildLoginBody(),
    );
  }

  Widget _buildLoginBody() {
    return Material(
      child: Container(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9 > 500 ? 500 : 300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 24.0),
                _buildUserIdField(),
                _buildPasswordField(),
                // _buildForgotPasswordButton(),
                _buildSignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Obx(() {
        return AppTextField(
          key: Key('User'),
          hint: 'login',
          inputType: TextInputType.emailAddress,
          icon: Icon(Icons.person, color: Colors.black54),
          textController: _emailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setUserLogin(_emailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.loginFormError.userEmailError.value,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Obx(() {
      return AppTextField(
        key: Key('PasswordField'),
        hint: 'password',
        inputType: TextInputType.visiblePassword,
        icon: Icon(Icons.lock),
        textController: _passwordController,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          _store.setPassword(value);
        },
        focusNode: _passwordFocusNode,
        errorText: _store.loginFormError.passwordError.value,
      );
    });
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: RoundedButton(
        buttonText: '??????????',
        buttonColor: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () async {
          if (_store.canLogin) {
            DeviceUtils.hideKeyboard(context);
            _store.signIn();
          } else {
            Toaster.showError('?????????????????? ?????? ???????????????????? ????????');
          }
        },
      ),
    );
  }
}
