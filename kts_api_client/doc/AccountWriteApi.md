# kts_booking_api.api.AccountWriteApi

## Load the API package
```dart
import 'package:kts_booking_api/api.dart';
```

All URIs are relative to *http://127.0.0.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountWriteCancelAppointment**](AccountWriteApi.md#accountwritecancelappointment) | **DELETE** /api/AccountWrite/appointments/cancel | 
[**accountWriteChangePassword**](AccountWriteApi.md#accountwritechangepassword) | **PUT** /api/AccountWrite/change-password | 
[**accountWriteCreateAppointment**](AccountWriteApi.md#accountwritecreateappointment) | **POST** /api/AccountWrite/appointment | 
[**accountWriteCreateCustomer**](AccountWriteApi.md#accountwritecreatecustomer) | **POST** /api/AccountWrite/customers | 
[**accountWriteCreateExpense**](AccountWriteApi.md#accountwritecreateexpense) | **POST** /api/AccountWrite/expense | 
[**accountWriteCreateIncome**](AccountWriteApi.md#accountwritecreateincome) | **POST** /api/AccountWrite/income | 
[**accountWriteCreateService**](AccountWriteApi.md#accountwritecreateservice) | **POST** /api/AccountWrite/services | 
[**accountWriteDelete**](AccountWriteApi.md#accountwritedelete) | **PUT** /api/AccountWrite/delete | 
[**accountWriteDeleteCustomer**](AccountWriteApi.md#accountwritedeletecustomer) | **DELETE** /api/AccountWrite/customers | 
[**accountWriteDeleteExpense**](AccountWriteApi.md#accountwritedeleteexpense) | **DELETE** /api/AccountWrite/expense | 
[**accountWriteDeleteIncome**](AccountWriteApi.md#accountwritedeleteincome) | **DELETE** /api/AccountWrite/income | 
[**accountWriteDeleteService**](AccountWriteApi.md#accountwritedeleteservice) | **DELETE** /api/AccountWrite/services | 
[**accountWriteForgotPassword**](AccountWriteApi.md#accountwriteforgotpassword) | **PUT** /api/AccountWrite/forgot-password | 
[**accountWriteSetNotificationRead**](AccountWriteApi.md#accountwritesetnotificationread) | **PUT** /api/AccountWrite/notifications/set-read | 
[**accountWriteSignup**](AccountWriteApi.md#accountwritesignup) | **POST** /api/AccountWrite/signup | 
[**accountWriteUpdateAccount**](AccountWriteApi.md#accountwriteupdateaccount) | **PUT** /api/AccountWrite | 
[**accountWriteUpdateAppointment**](AccountWriteApi.md#accountwriteupdateappointment) | **PUT** /api/AccountWrite/appointment | 
[**accountWriteUpdateCustomer**](AccountWriteApi.md#accountwriteupdatecustomer) | **PUT** /api/AccountWrite/customers | 
[**accountWriteUpdateExpense**](AccountWriteApi.md#accountwriteupdateexpense) | **PUT** /api/AccountWrite/expense | 
[**accountWriteUpdateIncome**](AccountWriteApi.md#accountwriteupdateincome) | **PUT** /api/AccountWrite/income | 
[**accountWriteUpdateService**](AccountWriteApi.md#accountwriteupdateservice) | **PUT** /api/AccountWrite/services | 
[**accountWriteUploadFile**](AccountWriteApi.md#accountwriteuploadfile) | **POST** /api/AccountWrite/file | 


# **accountWriteCancelAppointment**
> bool accountWriteCancelAppointment(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final CancelAppointmentRequest request = ; // CancelAppointmentRequest | 

try {
    final response = api.accountWriteCancelAppointment(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteCancelAppointment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CancelAppointmentRequest**](CancelAppointmentRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteChangePassword**
> bool accountWriteChangePassword(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final ChangePasswordRequest request = ; // ChangePasswordRequest | 

try {
    final response = api.accountWriteChangePassword(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteChangePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**ChangePasswordRequest**](ChangePasswordRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteCreateAppointment**
> CreateAppointmentResponse accountWriteCreateAppointment(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final CreateAppointmentRequest request = ; // CreateAppointmentRequest | 

try {
    final response = api.accountWriteCreateAppointment(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteCreateAppointment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateAppointmentRequest**](CreateAppointmentRequest.md)|  | 

### Return type

[**CreateAppointmentResponse**](CreateAppointmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteCreateCustomer**
> CreateCusotmerResponse accountWriteCreateCustomer(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final CreateCustomerRequest request = ; // CreateCustomerRequest | 

try {
    final response = api.accountWriteCreateCustomer(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteCreateCustomer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateCustomerRequest**](CreateCustomerRequest.md)|  | 

### Return type

[**CreateCusotmerResponse**](CreateCusotmerResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteCreateExpense**
> CreateExpenseResponse accountWriteCreateExpense(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final CreateExpenseRequest request = ; // CreateExpenseRequest | 

try {
    final response = api.accountWriteCreateExpense(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteCreateExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateExpenseRequest**](CreateExpenseRequest.md)|  | 

### Return type

[**CreateExpenseResponse**](CreateExpenseResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteCreateIncome**
> CreateIncomeResponse accountWriteCreateIncome(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final CreateIncomeRequest request = ; // CreateIncomeRequest | 

try {
    final response = api.accountWriteCreateIncome(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteCreateIncome: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateIncomeRequest**](CreateIncomeRequest.md)|  | 

### Return type

[**CreateIncomeResponse**](CreateIncomeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteCreateService**
> CreateServiceResponse accountWriteCreateService(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final CreateServiceRequest request = ; // CreateServiceRequest | 

try {
    final response = api.accountWriteCreateService(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteCreateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateServiceRequest**](CreateServiceRequest.md)|  | 

### Return type

[**CreateServiceResponse**](CreateServiceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteDelete**
> bool accountWriteDelete()



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();

try {
    final response = api.accountWriteDelete();
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteDelete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteDeleteCustomer**
> bool accountWriteDeleteCustomer(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final DeleteCustomerRequest request = ; // DeleteCustomerRequest | 

try {
    final response = api.accountWriteDeleteCustomer(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteDeleteCustomer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteCustomerRequest**](DeleteCustomerRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteDeleteExpense**
> bool accountWriteDeleteExpense(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final DeleteExpenseRequest request = ; // DeleteExpenseRequest | 

try {
    final response = api.accountWriteDeleteExpense(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteDeleteExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteExpenseRequest**](DeleteExpenseRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteDeleteIncome**
> bool accountWriteDeleteIncome(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final DeleteIncomeRequest request = ; // DeleteIncomeRequest | 

try {
    final response = api.accountWriteDeleteIncome(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteDeleteIncome: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteIncomeRequest**](DeleteIncomeRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteDeleteService**
> bool accountWriteDeleteService(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final DeleteServiceRequest request = ; // DeleteServiceRequest | 

try {
    final response = api.accountWriteDeleteService(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteDeleteService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteServiceRequest**](DeleteServiceRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteForgotPassword**
> bool accountWriteForgotPassword(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final ForgotPasswordRequest request = ; // ForgotPasswordRequest | 

try {
    final response = api.accountWriteForgotPassword(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteForgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**ForgotPasswordRequest**](ForgotPasswordRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteSetNotificationRead**
> bool accountWriteSetNotificationRead(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final SetNotificationRequest request = ; // SetNotificationRequest | 

try {
    final response = api.accountWriteSetNotificationRead(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteSetNotificationRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**SetNotificationRequest**](SetNotificationRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteSignup**
> SignupResponse accountWriteSignup(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final SignupRequest request = ; // SignupRequest | 

try {
    final response = api.accountWriteSignup(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteSignup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**SignupRequest**](SignupRequest.md)|  | 

### Return type

[**SignupResponse**](SignupResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUpdateAccount**
> UpdateAccountResponse accountWriteUpdateAccount(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final UpdateAccountRequest request = ; // UpdateAccountRequest | 

try {
    final response = api.accountWriteUpdateAccount(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUpdateAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateAccountRequest**](UpdateAccountRequest.md)|  | 

### Return type

[**UpdateAccountResponse**](UpdateAccountResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUpdateAppointment**
> UpdateAppointmentResponse accountWriteUpdateAppointment(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final UpdateAppointmentRequest request = ; // UpdateAppointmentRequest | 

try {
    final response = api.accountWriteUpdateAppointment(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUpdateAppointment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateAppointmentRequest**](UpdateAppointmentRequest.md)|  | 

### Return type

[**UpdateAppointmentResponse**](UpdateAppointmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUpdateCustomer**
> UpdateCusotmerResponse accountWriteUpdateCustomer(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final UpdateCustomerRequest request = ; // UpdateCustomerRequest | 

try {
    final response = api.accountWriteUpdateCustomer(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUpdateCustomer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateCustomerRequest**](UpdateCustomerRequest.md)|  | 

### Return type

[**UpdateCusotmerResponse**](UpdateCusotmerResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUpdateExpense**
> UpdateExpenseResponse accountWriteUpdateExpense(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final UpdateExpenseRequest request = ; // UpdateExpenseRequest | 

try {
    final response = api.accountWriteUpdateExpense(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUpdateExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateExpenseRequest**](UpdateExpenseRequest.md)|  | 

### Return type

[**UpdateExpenseResponse**](UpdateExpenseResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUpdateIncome**
> UpdateIncomeResponse accountWriteUpdateIncome(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final UpdateIncomeRequest request = ; // UpdateIncomeRequest | 

try {
    final response = api.accountWriteUpdateIncome(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUpdateIncome: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateIncomeRequest**](UpdateIncomeRequest.md)|  | 

### Return type

[**UpdateIncomeResponse**](UpdateIncomeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUpdateService**
> UpdateServiceResponse accountWriteUpdateService(request)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final UpdateServiceRequest request = ; // UpdateServiceRequest | 

try {
    final response = api.accountWriteUpdateService(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUpdateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateServiceRequest**](UpdateServiceRequest.md)|  | 

### Return type

[**UpdateServiceResponse**](UpdateServiceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountWriteUploadFile**
> UploadFileResponse accountWriteUploadFile(formFile)



### Example
```dart
import 'package:kts_booking_api/api.dart';

final api = KtsBookingApi().getAccountWriteApi();
final MultipartFile formFile = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.accountWriteUploadFile(formFile);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountWriteApi->accountWriteUploadFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **formFile** | **MultipartFile**|  | [optional] 

### Return type

[**UploadFileResponse**](UploadFileResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

