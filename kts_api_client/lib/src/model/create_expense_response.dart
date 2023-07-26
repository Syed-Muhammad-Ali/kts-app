//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_expense_response.g.dart';

/// CreateExpenseResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class CreateExpenseResponse implements Built<CreateExpenseResponse, CreateExpenseResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  CreateExpenseResponse._();

  factory CreateExpenseResponse([void updates(CreateExpenseResponseBuilder b)]) = _$CreateExpenseResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateExpenseResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateExpenseResponse> get serializer => _$CreateExpenseResponseSerializer();
}

class _$CreateExpenseResponseSerializer implements PrimitiveSerializer<CreateExpenseResponse> {
  @override
  final Iterable<Type> types = const [CreateExpenseResponse, _$CreateExpenseResponse];

  @override
  final String wireName = r'CreateExpenseResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateExpenseResponse object, {
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
    CreateExpenseResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateExpenseResponseBuilder result,
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
  CreateExpenseResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateExpenseResponseBuilder();
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

