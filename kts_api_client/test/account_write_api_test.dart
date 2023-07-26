import 'package:test/test.dart';
import 'package:kts_booking_api/kts_booking_api.dart';


/// tests for AccountWriteApi
void main() {
  final instance = KtsBookingApi().getAccountWriteApi();

  group(AccountWriteApi, () {
    //Future<CreateAppointmentResponse> accountWriteCreateAppointment(CreateAppointmentRequest request) async
    test('test accountWriteCreateAppointment', () async {
      // TODO
    });

    //Future<CreateCusotmerResponse> accountWriteCreateCustomer(CreateCustomerRequest request) async
    test('test accountWriteCreateCustomer', () async {
      // TODO
    });

    //Future<CreateExpenseResponse> accountWriteCreateExpense(CreateExpenseRequest request) async
    test('test accountWriteCreateExpense', () async {
      // TODO
    });

    //Future<SignupResponse> accountWriteSignup(SignupRequest request) async
    test('test accountWriteSignup', () async {
      // TODO
    });

    //Future<UpdateAppointmentResponse> accountWriteUpdateAppointment(UpdateAppointmentRequest request) async
    test('test accountWriteUpdateAppointment', () async {
      // TODO
    });

    //Future<UpdateCusotmerResponse> accountWriteUpdateCustomer(UpdateCustomerRequest request) async
    test('test accountWriteUpdateCustomer', () async {
      // TODO
    });

    //Future<UpdateExpenseResponse> accountWriteUpdateExpense(UpdateExpenseRequest request) async
    test('test accountWriteUpdateExpense', () async {
      // TODO
    });

    //Future<UploadFileResponse> accountWriteUploadFile({ MultipartFile formFile }) async
    test('test accountWriteUploadFile', () async {
      // TODO
    });

  });
}
