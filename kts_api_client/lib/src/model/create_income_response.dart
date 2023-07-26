//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_income_response.g.dart';

/// CreateIncomeResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class CreateIncomeResponse implements Built<CreateIncomeResponse, CreateIncomeResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  CreateIncomeResponse._();

  factory CreateIncomeResponse([void updates(CreateIncomeResponseBuilder b)]) = _$CreateIncomeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateIncomeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateIncomeResponse> get serializer => _$CreateIncomeResponseSerializer();
}

class _$CreateIncomeResponseSerializer implements PrimitiveSerializer<CreateIncomeResponse> {
  @override
  final Iterable<Type> types = const [CreateIncomeResponse, _$CreateIncomeResponse];

  @override
  final String wireName = r'CreateIncomeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateIncomeResponse object, {
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
    CreateIncomeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateIncomeResponseBuilder result,
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
  CreateIncomeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateIncomeResponseBuilder();
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

