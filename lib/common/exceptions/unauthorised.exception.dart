import 'package:kts_mobile/common/exceptions/app.exception.dart';

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}
