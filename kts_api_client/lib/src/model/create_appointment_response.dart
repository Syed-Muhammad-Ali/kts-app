//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_appointment_response.g.dart';

/// CreateAppointmentResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class CreateAppointmentResponse implements Built<CreateAppointmentResponse, CreateAppointmentResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  CreateAppointmentResponse._();

  factory CreateAppointmentResponse([void updates(CreateAppointmentResponseBuilder b)]) = _$CreateAppointmentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAppointmentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAppointmentResponse> get serializer => _$CreateAppointmentResponseSerializer();
}

class _$CreateAppointmentResponseSerializer implements PrimitiveSerializer<CreateAppointmentResponse> {
  @override
  final Iterable<Type> types = const [CreateAppointmentResponse, _$CreateAppointmentResponse];

  @override
  final String wireName = r'CreateAppointmentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAppointmentResponse object, {
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
    CreateAppointmentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateAppointmentResponseBuilder result,
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
  CreateAppointmentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAppointmentResponseBuilder();
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

