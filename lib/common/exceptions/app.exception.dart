class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    if (_prefix != null) {
      return "$_prefix$_message";
    }
    return "$_message";
  }
}
