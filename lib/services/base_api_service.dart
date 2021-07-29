import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BaseApi {
  BaseApi();

  String? apiKey;

  factory BaseApi.sandbox() => BaseApi();

  static final String  host = 'localhost';
  static final int  port = 3000;

  Uri getUrl(String path, [Map<String, dynamic>? params]) => Uri(
    scheme: 'http',
    path: path,
    queryParameters: params,
    host: host,
    port: port,
  );

  Map<String, String> getPostHeader() => {
    'Content-Type': 'application/json',
  };

  Future<Response> post (String url, body) async {
    try {
      return await http.post(
        this.getUrl(url),
        body: body,
        headers: this.getPostHeader(),
      );
    }on Exception catch (_) {
      return http.Response(jsonEncode({}), 500);
    }
  }

  Future<Response> get (String url, [Map<String, dynamic>? params]) async {
    try {
      return await http.get(
        this.getUrl(url, params),
      );
    }on Exception catch (_) {
      return http.Response(jsonEncode({}), 500);
    }
  }
}