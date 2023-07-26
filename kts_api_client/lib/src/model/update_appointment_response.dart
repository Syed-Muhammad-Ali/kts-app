//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_appointment_response.g.dart';

/// UpdateAppointmentResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UpdateAppointmentResponse implements Built<UpdateAppointmentResponse, UpdateAppointmentResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UpdateAppointmentResponse._();

  factory UpdateAppointmentResponse([void updates(UpdateAppointmentResponseBuilder b)]) = _$UpdateAppointmentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAppointmentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAppointmentResponse> get serializer => _$UpdateAppointmentResponseSerializer();
}

class _$UpdateAppointmentResponseSerializer implements PrimitiveSerializer<UpdateAppointmentResponse> {
  @override
  final Iterable<Type> types = const [UpdateAppointmentResponse, _$UpdateAppointmentResponse];

  @override
  final String wireName = r'UpdateAppointmentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAppointmentResponse object, {
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
    UpdateAppointmentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAppointmentResponseBuilder result,
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
  UpdateAppointmentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAppointmentResponseBuilder();
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

