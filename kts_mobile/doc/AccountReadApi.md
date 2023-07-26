# openapi.api.AccountReadApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://127.0.0.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountReadCreate**](AccountReadApi.md#accountreadcreate) | **GET** /api/AccountRead/create | 


# **accountReadCreate**
> String accountReadCreate()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountReadApi();

try {
    final result = api_instance.accountReadCreate();
    print(result);
} catch (e) {
    print('Exception when calling AccountReadApi->accountReadCreate: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

