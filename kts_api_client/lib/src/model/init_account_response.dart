//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/account_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_account_response.g.dart';

/// InitAccountResponse
///
/// Properties:
/// * [account] 
@BuiltValue()
abstract class InitAccountResponse implements Built<InitAccountResponse, InitAccountResponseBuilder> {
  @BuiltValueField(wireName: r'account')
  AccountDto? get account;

  InitAccountResponse._();

  factory InitAccountResponse([void updates(InitAccountResponseBuilder b)]) = _$InitAccountResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAccountResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAccountResponse> get serializer => _$InitAccountResponseSerializer();
}

class _$InitAccountResponseSerializer implements PrimitiveSerializer<InitAccountResponse> {
  @override
  final Iterable<Type> types = const [InitAccountResponse, _$InitAccountResponse];

  @override
  final String wireName = r'InitAccountResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAccountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.account != null) {
      yield r'account';
      yield serializers.serialize(
        object.account,
        specifiedType: const FullType(AccountDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAccountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAccountResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccountDto),
          ) as AccountDto;
          result.account.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAccountResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAccountResponseBuilder();
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

