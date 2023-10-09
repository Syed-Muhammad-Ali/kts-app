//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/payment.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_appointment_request.g.dart';

/// CreateAppointmentRequest
///
/// Properties:
/// * [startDateTime]
/// * [endDateTime]
/// * [customerId]
/// * [serviceId]
/// * [cost]
/// * [depositAmount]
/// * [tip]
/// * [payments]
@BuiltValue()
abstract class CreateAppointmentRequest
    implements
        Built<CreateAppointmentRequest, CreateAppointmentRequestBuilder> {
  @BuiltValueField(wireName: r'startDateTime')
  DateTime get startDateTime;

  @BuiltValueField(wireName: r'endDateTime')
  DateTime get endDateTime;

  @BuiltValueField(wireName: r'customerId')
  int get customerId;

  @BuiltValueField(wireName: r'serviceId')
  int get serviceId;

  @BuiltValueField(wireName: r'cost')
  num get cost;

  @BuiltValueField(wireName: r'depositAmount')
  num get depositAmount;

  @BuiltValueField(wireName: r'tip')
  int get tip;

  @BuiltValueField(wireName: r'payments')
  BuiltList<Payment>? get payments;

  CreateAppointmentRequest._();

  factory CreateAppointmentRequest(
          [void updates(CreateAppointmentRequestBuilder b)]) =
      _$CreateAppointmentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAppointmentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAppointmentRequest> get serializer =>
      _$CreateAppointmentRequestSerializer();
}

class _$CreateAppointmentRequestSerializer
    implements PrimitiveSerializer<CreateAppointmentRequest> {
  @override
  final Iterable<Type> types = const [
    CreateAppointmentRequest,
    _$CreateAppointmentRequest
  ];

  @override
  final String wireName = r'CreateAppointmentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAppointmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'cost';
    yield serializers.serialize(
      object.cost,
      specifiedType: const FullType(num),
    );
    yield r'depositAmount';
    yield serializers.serialize(
      object.depositAmount,
      specifiedType: const FullType(num),
    );
    yield r'tip';
    yield serializers.serialize(
      object.tip,
      specifiedType: const FullType(int),
    );
    if (object.payments != null) {
      yield r'payments';
      yield serializers.serialize(
        object.payments,
        specifiedType: const FullType(BuiltList, [FullType(Payment)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAppointmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateAppointmentRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.cost = valueDes;
          break;
        case r'depositAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.depositAmount = valueDes;
          break;
        case r'tip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.tip = valueDes;
          break;
        case r'payments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Payment)]),
          ) as BuiltList<Payment>;
          result.payments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAppointmentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAppointmentRequestBuilder();
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
