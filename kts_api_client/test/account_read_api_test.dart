import 'package:test/test.dart';
import 'package:kts_booking_api/kts_booking_api.dart';


/// tests for AccountReadApi
void main() {
  final instance = KtsBookingApi().getAccountReadApi();

  group(AccountReadApi, () {
    //Future<GetAppointmentResponse> accountReadGetAppointments({ DateTime start, DateTime end }) async
    test('test accountReadGetAppointments', () async {
      // TODO
    });

    //Future<InitAccountResponse> accountReadInitAccount({ int id }) async
    test('test accountReadInitAccount', () async {
      // TODO
    });

    //Future<InitAccountExpenseResponse> accountReadInitAccountExpense({ int expenseId }) async
    test('test accountReadInitAccountExpense', () async {
      // TODO
    });

    //Future<InitAccountExpensesResponse> accountReadInitAccountExpenses({ int accountingPeriodId }) async
    test('test accountReadInitAccountExpenses', () async {
      // TODO
    });

  });
}
