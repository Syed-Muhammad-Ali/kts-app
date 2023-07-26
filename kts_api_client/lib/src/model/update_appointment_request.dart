//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/payment2.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_appointment_request.g.dart';

/// UpdateAppointmentRequest
///
/// Properties:
/// * [id] 
/// * [customerId] 
/// * [serviceId] 
/// * [startDateTime] 
/// * [endDateTime] 
/// * [depositAmount] 
/// * [cost] 
/// * [addPayments] 
/// * [removePayments] 
@BuiltValue()
abstract class UpdateAppointmentRequest implements Built<UpdateAppointmentRequest, UpdateAppointmentRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'customerId')
  int get customerId;

  @BuiltValueField(wireName: r'serviceId')
  int get serviceId;

  @BuiltValueField(wireName: r'startDateTime')
  DateTime get startDateTime;

  @BuiltValueField(wireName: r'endDateTime')
  DateTime get endDateTime;

  @BuiltValueField(wireName: r'depositAmount')
  num get depositAmount;

  @BuiltValueField(wireName: r'cost')
  num get cost;

  @BuiltValueField(wireName: r'addPayments')
  BuiltList<Payment2>? get addPayments;

  @BuiltValueField(wireName: r'removePayments')
  BuiltList<int>? get removePayments;

  UpdateAppointmentRequest._();

  factory UpdateAppointmentRequest([void updates(UpdateAppointmentRequestBuilder b)]) = _$UpdateAppointmentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAppointmentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAppointmentRequest> get serializer => _$UpdateAppointmentRequestSerializer();
}

class _$UpdateAppointmentRequestSerializer implements PrimitiveSerializer<UpdateAppointmentRequest> {
  @override
  final Iterable<Type> types = const [UpdateAppointmentRequest, _$UpdateAppointmentRequest];

  @override
  final String wireName = r'UpdateAppointmentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAppointmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'customerId';
    yield serializers.serialize(
      object.customerId,
      specifiedType: const FullType(int),
    );
    yield r'serviceId';
    yield serializers.serialize(
      object.serviceId,
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
    yield r'depositAmount';
    yield serializers.serialize(
      object.depositAmount,
      specifiedType: const FullType(num),
    );
    yield r'cost';
    yield serializers.serialize(
      object.cost,
      specifiedType: const FullType(num),
    );
    if (object.addPayments != null) {
      yield r'addPayments';
      yield serializers.serialize(
        object.addPayments,
        specifiedType: const FullType(BuiltList, [FullType(Payment2)]),
      );
    }
    if (object.removePayments != null) {
      yield r'removePayments';
      yield serializers.serialize(
        object.removePayments,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateAppointmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAppointmentRequestBuilder result,
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
        case r'customerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.customerId = valueDes;
          break;
        case r'serviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.serviceId = valueDes;
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
        case r'depositAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.depositAmount = valueDes;
          break;
        case r'cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cost = valueDes;
          break;
        case r'addPayments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Payment2)]),
          ) as BuiltList<Payment2>;
          result.addPayments.replace(valueDes);
          break;
        case r'removePayments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.removePayments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateAppointmentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAppointmentRequestBuilder();
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

