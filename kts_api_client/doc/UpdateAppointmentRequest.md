# kts_booking_api.model.UpdateAppointmentRequest

## Load the model package
```dart
import 'package:kts_booking_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**customerId** | **int** |  | 
**serviceId** | **int** |  | 
**startDateTime** | [**DateTime**](DateTime.md) |  | 
**endDateTime** | [**DateTime**](DateTime.md) |  | 
**depositAmount** | **num** |  | 
**cost** | **num** |  | 
**addPayments** | [**BuiltList&lt;Payment2&gt;**](Payment2.md) |  | [optional] 
**removePayments** | **BuiltList&lt;int&gt;** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


