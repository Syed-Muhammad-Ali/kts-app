//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_response.g.dart';

/// UpdateAccountResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UpdateAccountResponse implements Built<UpdateAccountResponse, UpdateAccountResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UpdateAccountResponse._();

  factory UpdateAccountResponse([void updates(UpdateAccountResponseBuilder b)]) = _$UpdateAccountResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAccountResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAccountResponse> get serializer => _$UpdateAccountResponseSerializer();
}

class _$UpdateAccountResponseSerializer implements PrimitiveSerializer<UpdateAccountResponse> {
  @override
  final Iterable<Type> types = const [UpdateAccountResponse, _$UpdateAccountResponse];

  @override
  final String wireName = r'UpdateAccountResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAccountResponse object, {
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
    UpdateAccountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAccountResponseBuilder result,
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
  UpdateAccountResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAccountResponseBuilder();
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

