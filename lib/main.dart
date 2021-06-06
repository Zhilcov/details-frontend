import 'package:details_frontend/bindings/login_page_binding.dart';
import 'package:details_frontend/bindings/main_page_binding.dart';
import 'package:details_frontend/navigation/paths_list_enum.dart';
import 'package:details_frontend/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:details_frontend/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Paths.mainPage,
      getPages: [
        GetPage(name: Paths.mainPage, page: () => MainPage(), binding: MainPageBinding()),
        GetPage(
            name: Paths.loginPage,
            page: () => LoginPage(),
            binding: LoginPageBinding(),
            transition: Transition.zoom),
      ],
    );
  }
}
