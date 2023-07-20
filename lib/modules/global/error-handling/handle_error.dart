import 'dart:io';

import 'package:dio/dio.dart';

handleError(err) {
  if (err is SocketException) {
  }
  // if is bad request we want to show the contents in a dialog
  else if (err is DioError &&
      err.type == DioErrorType.badResponse &&
      err.response!.statusCode == HttpStatus.badRequest) {
  } else {}
}
