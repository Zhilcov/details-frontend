import 'package:details_frontend/bindings/login_page_binding.dart';
import 'package:details_frontend/bindings/main_page_binding.dart';
import 'package:details_frontend/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:details_frontend/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/singIn',
      getPages: [
        GetPage(name: '/', page: () => MainPage(), binding: MainPageBinding()),
        GetPage(
            name: '/singIn',
            page: () => LoginPage(),
            binding: LoginPageBinding(),
            transition: Transition.zoom),
      ],
    );
  }
}
