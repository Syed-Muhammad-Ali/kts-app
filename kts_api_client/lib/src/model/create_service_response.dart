//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_service_response.g.dart';

/// CreateServiceResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class CreateServiceResponse implements Built<CreateServiceResponse, CreateServiceResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  CreateServiceResponse._();

  factory CreateServiceResponse([void updates(CreateServiceResponseBuilder b)]) = _$CreateServiceResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateServiceResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateServiceResponse> get serializer => _$CreateServiceResponseSerializer();
}

class _$CreateServiceResponseSerializer implements PrimitiveSerializer<CreateServiceResponse> {
  @override
  final Iterable<Type> types = const [CreateServiceResponse, _$CreateServiceResponse];

  @override
  final String wireName = r'CreateServiceResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateServiceResponse object, {
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
    CreateServiceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateServiceResponseBuilder result,
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
  CreateServiceResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateServiceResponseBuilder();
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

