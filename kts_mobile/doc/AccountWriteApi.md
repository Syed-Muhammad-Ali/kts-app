# openapi.api.AccountWriteApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://127.0.0.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountWriteSignup**](AccountWriteApi.md#accountwritesignup) | **POST** /api/AccountWrite/signup | 


# **accountWriteSignup**
> SignupResponse accountWriteSignup(request)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountWriteApi();
final request = SignupRequest(); // SignupRequest | 

try {
    final result = api_instance.accountWriteSignup(request);
    print(result);
} catch (e) {
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

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

