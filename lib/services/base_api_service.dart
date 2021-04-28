class BaseApi {
  BaseApi();

  String apiKey;

  factory BaseApi.sandbox() => BaseApi();

  static final String  host = 'localhost';
  static final int  port = 3000;

  Uri getUrl(String path) => Uri(
    scheme: 'http',
    path: path,
    host: host,
    port: port,
  );
}