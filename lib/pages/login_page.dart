import 'package:details_frontend/components/ui/app_icon.dart';
import 'package:details_frontend/components/ui/empty_app_bar.dart';
import 'package:details_frontend/components/ui/rounded_button.dart';
import 'package:details_frontend/components/ui/text_field.dart';
import 'package:details_frontend/store/login_form/login_form_store.dart';
import 'package:details_frontend/utils/device/device_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _passwordFocusNode;

  final _store = LoginFormStore();

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
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/img_login.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIcon(image: 'assets/icons/ic_appicon.png'),
            SizedBox(height: 24.0),
            _buildUserIdField(),
            _buildPasswordField(),
            // _buildForgotPasswordButton(),
            _buildSignInButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return AppTextField(
          hint: 'login',
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: false ? Colors.white70 : Colors.black54,
          textController: _emailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setUserLogin(_emailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.LoginformErrorStore.userEmailError,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(builder: (context) {
      return AppTextField(
        hint: 'password',
        inputType: TextInputType.visiblePassword,
        icon: Icons.lock,
        textController: _passwordController,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          _store.setPassword(value);
        },
        focusNode: _passwordFocusNode,
        errorText: _store.LoginformErrorStore.passwordError,
      );
    });
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: RoundedButton(
        buttonText: 'Войти',
        buttonColor: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () async {
          if (_store.canLogin) {
            DeviceUtils.hideKeyboard(context);
            _store.signIn();
          } else {
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            // _showErrorMessage('Заполните поля');
          }
        },
      ),
    );
  }


}
