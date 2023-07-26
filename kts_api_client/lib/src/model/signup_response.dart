//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'signup_response.g.dart';

/// SignupResponse
///
/// Properties:
/// * [accountId] 
@BuiltValue()
abstract class SignupResponse implements Built<SignupResponse, SignupResponseBuilder> {
  @BuiltValueField(wireName: r'accountId')
  int get accountId;

  SignupResponse._();

  factory SignupResponse([void updates(SignupResponseBuilder b)]) = _$SignupResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SignupResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SignupResponse> get serializer => _$SignupResponseSerializer();
}

class _$SignupResponseSerializer implements PrimitiveSerializer<SignupResponse> {
  @override
  final Iterable<Type> types = const [SignupResponse, _$SignupResponse];

  @override
  final String wireName = r'SignupResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SignupResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accountId';
    yield serializers.serialize(
      object.accountId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SignupResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SignupResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accountId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.accountId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SignupResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SignupResponseBuilder();
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

