//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/customer_dto.dart';
import 'package:kts_booking_api/src/model/service_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointment_dto.g.dart';

/// AppointmentDto
///
/// Properties:
/// * [id] 
/// * [startDateTime] 
/// * [endDateTime] 
/// * [customer] 
/// * [services] 
/// * [cost] 
/// * [deposit] 
/// * [remainingBalance] 
@BuiltValue()
abstract class AppointmentDto implements Built<AppointmentDto, AppointmentDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'startDateTime')
  DateTime get startDateTime;

  @BuiltValueField(wireName: r'endDateTime')
  DateTime get endDateTime;

  @BuiltValueField(wireName: r'customer')
  CustomerDto? get customer;

  @BuiltValueField(wireName: r'services')
  ServiceDto? get services;

  @BuiltValueField(wireName: r'cost')
  num get cost;

  @BuiltValueField(wireName: r'deposit')
  num get deposit;

  @BuiltValueField(wireName: r'remainingBalance')
  num get remainingBalance;

  AppointmentDto._();

  factory AppointmentDto([void updates(AppointmentDtoBuilder b)]) = _$AppointmentDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppointmentDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppointmentDto> get serializer => _$AppointmentDtoSerializer();
}

class _$AppointmentDtoSerializer implements PrimitiveSerializer<AppointmentDto> {
  @override
  final Iterable<Type> types = const [AppointmentDto, _$AppointmentDto];

  @override
  final String wireName = r'AppointmentDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppointmentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'startDateTime';
    yield serializers.serialize(
      object.startDateTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'endDateTime';
    yield serializers.serialize(
      object.endDateTime,
      specifiedType: const FullType(DateTime),
    );
    if (object.customer != null) {
      yield r'customer';
      yield serializers.serialize(
        object.customer,
        specifiedType: const FullType(CustomerDto),
      );
    }
    if (object.services != null) {
      yield r'services';
      yield serializers.serialize(
        object.services,
        specifiedType: const FullType(ServiceDto),
      );
    }
    yield r'cost';
    yield serializers.serialize(
      object.cost,
      specifiedType: const FullType(num),
    );
    yield r'deposit';
    yield serializers.serialize(
      object.deposit,
      specifiedType: const FullType(num),
    );
    yield r'remainingBalance';
    yield serializers.serialize(
      object.remainingBalance,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AppointmentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppointmentDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'startDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startDateTime = valueDes;
          break;
        case r'endDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endDateTime = valueDes;
          break;
        case r'customer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CustomerDto),
          ) as CustomerDto;
          result.customer.replace(valueDes);
          break;
        case r'services':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ServiceDto),
          ) as ServiceDto;
          result.services.replace(valueDes);
          break;
        case r'cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cost = valueDes;
          break;
        case r'deposit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.deposit = valueDes;
          break;
        case r'remainingBalance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.remainingBalance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AppointmentDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppointmentDtoBuilder();
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

