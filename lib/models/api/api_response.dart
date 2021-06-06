class APIResponse<T> {
  T data;
  bool success;
  String message;

  APIResponse({required this.data, required this.message, this.success=true});
}