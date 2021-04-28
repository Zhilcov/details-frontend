import 'dart:convert';

import 'package:details_frontend/models/api/api_response.dart';
import 'package:details_frontend/models/user/user.dart';
import 'package:details_frontend/services/base_api_service.dart';
import 'package:details_frontend/utils/device/response_handler.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final BaseApi api;

  AuthService(this.api);

  Future<APIResponse<User>> signIn(String login, String password) async {

    final res = await http.post(
      api.getUrl('auth/signIn').toString(),
      body: jsonEncode(<String, String>{
        'login': login,
        'password': password
      }),
    );

    var handledRes = ResponseStatusHandler.parse(res);

    return APIResponse<User>(data: User.fromJson(handledRes.data), success: handledRes.success, message: handledRes.message);
  }
}