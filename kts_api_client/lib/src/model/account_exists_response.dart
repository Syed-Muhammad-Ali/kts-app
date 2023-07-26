//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_exists_response.g.dart';

/// AccountExistsResponse
///
/// Properties:
/// * [exists] 
@BuiltValue()
abstract class AccountExistsResponse implements Built<AccountExistsResponse, AccountExistsResponseBuilder> {
  @BuiltValueField(wireName: r'exists')
  bool get exists;

  AccountExistsResponse._();

  factory AccountExistsResponse([void updates(AccountExistsResponseBuilder b)]) = _$AccountExistsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountExistsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountExistsResponse> get serializer => _$AccountExistsResponseSerializer();
}

class _$AccountExistsResponseSerializer implements PrimitiveSerializer<AccountExistsResponse> {
  @override
  final Iterable<Type> types = const [AccountExistsResponse, _$AccountExistsResponse];

  @override
  final String wireName = r'AccountExistsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountExistsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'exists';
    yield serializers.serialize(
      object.exists,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountExistsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AccountExistsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'exists':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.exists = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountExistsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountExistsResponseBuilder();
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

