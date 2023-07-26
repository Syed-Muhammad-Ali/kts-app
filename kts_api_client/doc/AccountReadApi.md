# kts_booking_api.api.AccountReadApi

## Load the API package
```dart
import 'package:kts_booking_api/api.dart';
```

All URIs are relative to *http://127.0.0.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountReadAccountExists**](AccountReadApi.md#accountreadaccountexists) | **GET** /api/AccountRead/account-exists/:email | 
[**accountReadGetAccount**](AccountReadApi.md#accountreadgetaccount) | **GET** /api/AccountRead/account | 
[**accountReadGetAccountNotifications**](AccountReadApi.md#accountreadgetaccountnotifications) | **GET** /api/AccountRead/notifications | 
[**accountReadGetAccoutingPeriodOverview**](AccountReadApi.md#accountreadgetaccoutingperiodoverview) | **GET** /api/AccountRead/overview | 
[**accountReadGetAppointments**](AccountReadApi.md#accountreadgetappointments) | **GET** /api/AccountRead/appointments | 
[**accountReadInitAccountExpense**](AccountReadApi.md#accountreadinitaccountexpense) | **GET** /api/AccountRead/init-account-expense | 
[**accountReadInitAccountExpensesByCategory**](AccountReadApi.md#accountreadinitaccountexpensesbycategory) | **GET** /api/AccountRead/init-account-expenses-by-category | 
[**accountReadInitAccountExpensesForCategory**](AccountReadApi.md#accountreadinitaccountexpensesforcategory) | **GET** /api/AccountRead/init-account-expenses-for-category | 
[**accountReadInitAccountIncome**](AccountReadApi.md#accountreadinitaccountincome) | **GET** /api/AccountRead/init-account-income | 
[**accountReadInitAccountIncomes**](AccountReadApi.md#accountreadinitaccountincomes) | **GET** /api/AccountRead/init-account-incomes | 
[**accountReadInitAppointment**](AccountReadApi.md#accountreadinitappointment) | **GET** /api/AccountRead/init-appointment | 
[**accountReadInitCustomers**](AccountReadApi.md#accountreadinitcustomers) | **GET** /api/AccountRead/init-customers | 
[**accountReadInitServices**](AccountReadApi.md#accountreadinitservices) | **GET** /api/AccountRead/init-services | 
[**accountReadShouldUpdate**](AccountReadApi.md#accountreadshouldupdate) | **GET** /api/AccountRead/should-update | 


# **accountReadAccountExists**
> AccountExistsResponse accountReadAccountExists(email)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final String email = email_example; // String | 

try {
    final response = api.accountReadAccountExists(email);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadAccountExists: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | [optional] 

### Return type

[**AccountExistsResponse**](AccountExistsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadGetAccount**
> GetAccountResponse accountReadGetAccount()



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();

try {
    final response = api.accountReadGetAccount();
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadGetAccount: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetAccountResponse**](GetAccountResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadGetAccountNotifications**
> GetAccountNotificationsResponse accountReadGetAccountNotifications(all)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final bool all = true; // bool | 

try {
    final response = api.accountReadGetAccountNotifications(all);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadGetAccountNotifications: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **all** | **bool**|  | [optional] [default to false]

### Return type

[**GetAccountNotificationsResponse**](GetAccountNotificationsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadGetAccoutingPeriodOverview**
> AccountingPeriodOverviewResponse accountReadGetAccoutingPeriodOverview(accountingPeriodId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int accountingPeriodId = 789; // int | 

try {
    final response = api.accountReadGetAccoutingPeriodOverview(accountingPeriodId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadGetAccoutingPeriodOverview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountingPeriodId** | **int**|  | [optional] 

### Return type

[**AccountingPeriodOverviewResponse**](AccountingPeriodOverviewResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadGetAppointments**
> GetAppointmentResponse accountReadGetAppointments(start, end)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final DateTime start = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime end = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.accountReadGetAppointments(start, end);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadGetAppointments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **DateTime**|  | [optional] 
 **end** | **DateTime**|  | [optional] 

### Return type

[**GetAppointmentResponse**](GetAppointmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitAccountExpense**
> InitAccountExpenseResponse accountReadInitAccountExpense(expenseId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int expenseId = 789; // int | 

try {
    final response = api.accountReadInitAccountExpense(expenseId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitAccountExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expenseId** | **int**|  | [optional] 

### Return type

[**InitAccountExpenseResponse**](InitAccountExpenseResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitAccountExpensesByCategory**
> InitAccountExpenseByCategoryResponse accountReadInitAccountExpensesByCategory(accountingPeriodId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int accountingPeriodId = 789; // int | 

try {
    final response = api.accountReadInitAccountExpensesByCategory(accountingPeriodId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitAccountExpensesByCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountingPeriodId** | **int**|  | [optional] 

### Return type

[**InitAccountExpenseByCategoryResponse**](InitAccountExpenseByCategoryResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitAccountExpensesForCategory**
> InitAccountExpensesResponse accountReadInitAccountExpensesForCategory(categoryId, accountingPeriodId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int categoryId = 789; // int | 
final int accountingPeriodId = 789; // int | 

try {
    final response = api.accountReadInitAccountExpensesForCategory(categoryId, accountingPeriodId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitAccountExpensesForCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **int**|  | [optional] 
 **accountingPeriodId** | **int**|  | [optional] 

### Return type

[**InitAccountExpensesResponse**](InitAccountExpensesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitAccountIncome**
> InitAccountIncomeResponse accountReadInitAccountIncome(incomeId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int incomeId = 789; // int | 

try {
    final response = api.accountReadInitAccountIncome(incomeId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitAccountIncome: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **incomeId** | **int**|  | [optional] 

### Return type

[**InitAccountIncomeResponse**](InitAccountIncomeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitAccountIncomes**
> InitAccountIncomesResponse accountReadInitAccountIncomes(accountingPeriodId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int accountingPeriodId = 789; // int | 

try {
    final response = api.accountReadInitAccountIncomes(accountingPeriodId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitAccountIncomes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountingPeriodId** | **int**|  | [optional] 

### Return type

[**InitAccountIncomesResponse**](InitAccountIncomesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitAppointment**
> InitAppointmentResponse accountReadInitAppointment(appointmentId)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final int appointmentId = 789; // int | 

try {
    final response = api.accountReadInitAppointment(appointmentId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitAppointment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **int**|  | [optional] 

### Return type

[**InitAppointmentResponse**](InitAppointmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitCustomers**
> InitCustomersResponse accountReadInitCustomers()



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();

try {
    final response = api.accountReadInitCustomers();
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitCustomers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InitCustomersResponse**](InitCustomersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadInitServices**
> InitServicesResponse accountReadInitServices()



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();

try {
    final response = api.accountReadInitServices();
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadInitServices: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InitServicesResponse**](InitServicesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountReadShouldUpdate**
> bool accountReadShouldUpdate(versionLabel)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountReadApi();
final String versionLabel = versionLabel_example; // String | 

try {
    final response = api.accountReadShouldUpdate(versionLabel);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountReadApi->accountReadShouldUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **versionLabel** | **String**|  | [optional] 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

