//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_response.g.dart';

/// UpdateIncomeResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UpdateIncomeResponse implements Built<UpdateIncomeResponse, UpdateIncomeResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UpdateIncomeResponse._();

  factory UpdateIncomeResponse([void updates(UpdateIncomeResponseBuilder b)]) = _$UpdateIncomeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeResponse> get serializer => _$UpdateIncomeResponseSerializer();
}

class _$UpdateIncomeResponseSerializer implements PrimitiveSerializer<UpdateIncomeResponse> {
  @override
  final Iterable<Type> types = const [UpdateIncomeResponse, _$UpdateIncomeResponse];

  @override
  final String wireName = r'UpdateIncomeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeResponse object, {
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
    UpdateIncomeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeResponseBuilder result,
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
  UpdateIncomeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeResponseBuilder();
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

