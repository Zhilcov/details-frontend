import 'dart:convert';

import 'package:http/http.dart';

class ParsedResponse {
  Map<String, dynamic> data;
  bool success;
  String message;

  ParsedResponse(this.data, [this.success = true, this.message = '']);
}

class ResponseStatusHandler {
  static ParsedResponse parse<T>(Response response) {

    var jsonData = json.decode(response.body);
    var parsedResponse = ParsedResponse(jsonData);
    var resMsg = jsonData['message'];
    print(jsonData);

    switch (response.statusCode) {
      case 200:
        {
          parsedResponse.message = resMsg ?? 'Успешно заебись';
        }
        break;
      case 404:
        {
          parsedResponse.message =  resMsg ?? 'Неуспешно не найдено';
          parsedResponse.success = false;
        }
        break;

      case 500:
        {
          parsedResponse.message = 'Все хуева ошибка сервера';
          parsedResponse.success = false;
        }
        break;
    }

    return parsedResponse;
  }
}