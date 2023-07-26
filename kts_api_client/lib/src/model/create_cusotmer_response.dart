//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_cusotmer_response.g.dart';

/// CreateCusotmerResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class CreateCusotmerResponse implements Built<CreateCusotmerResponse, CreateCusotmerResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  CreateCusotmerResponse._();

  factory CreateCusotmerResponse([void updates(CreateCusotmerResponseBuilder b)]) = _$CreateCusotmerResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCusotmerResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCusotmerResponse> get serializer => _$CreateCusotmerResponseSerializer();
}

class _$CreateCusotmerResponseSerializer implements PrimitiveSerializer<CreateCusotmerResponse> {
  @override
  final Iterable<Type> types = const [CreateCusotmerResponse, _$CreateCusotmerResponse];

  @override
  final String wireName = r'CreateCusotmerResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCusotmerResponse object, {
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
    CreateCusotmerResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCusotmerResponseBuilder result,
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
  CreateCusotmerResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCusotmerResponseBuilder();
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

