import 'package:kts_mobile/common/exceptions/app.exception.dart';

class InvalidCredentialsException extends AppException {
  InvalidCredentialsException([message]) : super(message, "");
}
