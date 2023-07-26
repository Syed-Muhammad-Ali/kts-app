//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reset_password_request.g.dart';

/// ResetPasswordRequest
///
/// Properties:
/// * [userId] 
/// * [token] 
/// * [password] 
@BuiltValue()
abstract class ResetPasswordRequest implements Built<ResetPasswordRequest, ResetPasswordRequestBuilder> {
  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'token')
  String? get token;

  @BuiltValueField(wireName: r'password')
  String? get password;

  ResetPasswordRequest._();

  factory ResetPasswordRequest([void updates(ResetPasswordRequestBuilder b)]) = _$ResetPasswordRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResetPasswordRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResetPasswordRequest> get serializer => _$ResetPasswordRequestSerializer();
}

class _$ResetPasswordRequestSerializer implements PrimitiveSerializer<ResetPasswordRequest> {
  @override
  final Iterable<Type> types = const [ResetPasswordRequest, _$ResetPasswordRequest];

  @override
  final String wireName = r'ResetPasswordRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResetPasswordRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType(String),
      );
    }
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ResetPasswordRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ResetPasswordRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResetPasswordRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResetPasswordRequestBuilder();
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

