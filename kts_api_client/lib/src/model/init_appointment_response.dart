//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/customer_dto.dart';
import 'package:kts_booking_api/src/model/appointment_dto.dart';
import 'package:kts_booking_api/src/model/income_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/service_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_appointment_response.g.dart';

/// InitAppointmentResponse
///
/// Properties:
/// * [customers] 
/// * [services] 
/// * [income] 
/// * [appointment] 
@BuiltValue()
abstract class InitAppointmentResponse implements Built<InitAppointmentResponse, InitAppointmentResponseBuilder> {
  @BuiltValueField(wireName: r'customers')
  BuiltList<CustomerDto>? get customers;

  @BuiltValueField(wireName: r'services')
  BuiltList<ServiceDto>? get services;

  @BuiltValueField(wireName: r'income')
  BuiltList<IncomeDto>? get income;

  @BuiltValueField(wireName: r'appointment')
  AppointmentDto? get appointment;

  InitAppointmentResponse._();

  factory InitAppointmentResponse([void updates(InitAppointmentResponseBuilder b)]) = _$InitAppointmentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAppointmentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAppointmentResponse> get serializer => _$InitAppointmentResponseSerializer();
}

class _$InitAppointmentResponseSerializer implements PrimitiveSerializer<InitAppointmentResponse> {
  @override
  final Iterable<Type> types = const [InitAppointmentResponse, _$InitAppointmentResponse];

  @override
  final String wireName = r'InitAppointmentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAppointmentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.customers != null) {
      yield r'customers';
      yield serializers.serialize(
        object.customers,
        specifiedType: const FullType(BuiltList, [FullType(CustomerDto)]),
      );
    }
    if (object.services != null) {
      yield r'services';
      yield serializers.serialize(
        object.services,
        specifiedType: const FullType(BuiltList, [FullType(ServiceDto)]),
      );
    }
    if (object.income != null) {
      yield r'income';
      yield serializers.serialize(
        object.income,
        specifiedType: const FullType(BuiltList, [FullType(IncomeDto)]),
      );
    }
    if (object.appointment != null) {
      yield r'appointment';
      yield serializers.serialize(
        object.appointment,
        specifiedType: const FullType(AppointmentDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAppointmentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAppointmentResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'customers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CustomerDto)]),
          ) as BuiltList<CustomerDto>;
          result.customers.replace(valueDes);
          break;
        case r'services':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ServiceDto)]),
          ) as BuiltList<ServiceDto>;
          result.services.replace(valueDes);
          break;
        case r'income':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(IncomeDto)]),
          ) as BuiltList<IncomeDto>;
          result.income.replace(valueDes);
          break;
        case r'appointment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppointmentDto),
          ) as AppointmentDto;
          result.appointment.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAppointmentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAppointmentResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

