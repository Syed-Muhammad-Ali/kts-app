//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_expense_response.g.dart';

/// UpdateExpenseResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UpdateExpenseResponse implements Built<UpdateExpenseResponse, UpdateExpenseResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UpdateExpenseResponse._();

  factory UpdateExpenseResponse([void updates(UpdateExpenseResponseBuilder b)]) = _$UpdateExpenseResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateExpenseResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateExpenseResponse> get serializer => _$UpdateExpenseResponseSerializer();
}

class _$UpdateExpenseResponseSerializer implements PrimitiveSerializer<UpdateExpenseResponse> {
  @override
  final Iterable<Type> types = const [UpdateExpenseResponse, _$UpdateExpenseResponse];

  @override
  final String wireName = r'UpdateExpenseResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateExpenseResponse object, {
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
    UpdateExpenseResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateExpenseResponseBuilder result,
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
  UpdateExpenseResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateExpenseResponseBuilder();
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

