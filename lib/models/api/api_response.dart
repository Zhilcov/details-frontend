class APIResponse<T> {
  T data;
  bool success;
  String message;

  APIResponse({this.data, this.message, this.success=true});
}