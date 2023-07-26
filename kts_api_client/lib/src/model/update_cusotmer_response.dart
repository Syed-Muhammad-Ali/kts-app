//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_cusotmer_response.g.dart';

/// UpdateCusotmerResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UpdateCusotmerResponse implements Built<UpdateCusotmerResponse, UpdateCusotmerResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UpdateCusotmerResponse._();

  factory UpdateCusotmerResponse([void updates(UpdateCusotmerResponseBuilder b)]) = _$UpdateCusotmerResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCusotmerResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCusotmerResponse> get serializer => _$UpdateCusotmerResponseSerializer();
}

class _$UpdateCusotmerResponseSerializer implements PrimitiveSerializer<UpdateCusotmerResponse> {
  @override
  final Iterable<Type> types = const [UpdateCusotmerResponse, _$UpdateCusotmerResponse];

  @override
  final String wireName = r'UpdateCusotmerResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCusotmerResponse object, {
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
    UpdateCusotmerResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateCusotmerResponseBuilder result,
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
  UpdateCusotmerResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCusotmerResponseBuilder();
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

