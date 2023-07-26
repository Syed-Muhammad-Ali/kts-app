//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cancel_appointment_request.g.dart';

/// CancelAppointmentRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class CancelAppointmentRequest implements Built<CancelAppointmentRequest, CancelAppointmentRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  CancelAppointmentRequest._();

  factory CancelAppointmentRequest([void updates(CancelAppointmentRequestBuilder b)]) = _$CancelAppointmentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CancelAppointmentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CancelAppointmentRequest> get serializer => _$CancelAppointmentRequestSerializer();
}

class _$CancelAppointmentRequestSerializer implements PrimitiveSerializer<CancelAppointmentRequest> {
  @override
  final Iterable<Type> types = const [CancelAppointmentRequest, _$CancelAppointmentRequest];

  @override
  final String wireName = r'CancelAppointmentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CancelAppointmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CancelAppointmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CancelAppointmentRequestBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CancelAppointmentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CancelAppointmentRequestBuilder();
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

