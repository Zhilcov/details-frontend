import 'dart:convert';

import 'package:details_frontend/models/api/api_response.dart';
import 'package:http/http.dart';

class ParsedResponse {
  Map<String, dynamic> data;
  bool success;
  String message;

  ParsedResponse(this.data, [this.success = true, this.message = '']);
}

class ResponseStatusHandler {
  static APIResponse parse<T>(Response response) {
    var jsonData = ParsedResponse(json.decode(response.body));

    switch (response.statusCode) {
      case 200:
        {
          jsonData.message = 'Успешно заебись';
        }
        break;

      case 404:
        {
          jsonData.message = 'Неуспешно не найдено';
          jsonData.success = false;
        }
        break;

      case 404:
        {
          jsonData.message = 'Все хуева ошибка сервера';
          jsonData.success = false;
        }
        break;
    }
  }
}