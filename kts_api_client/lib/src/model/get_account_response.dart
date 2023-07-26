//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/account_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_account_response.g.dart';

/// GetAccountResponse
///
/// Properties:
/// * [account] 
@BuiltValue()
abstract class GetAccountResponse implements Built<GetAccountResponse, GetAccountResponseBuilder> {
  @BuiltValueField(wireName: r'account')
  AccountDto? get account;

  GetAccountResponse._();

  factory GetAccountResponse([void updates(GetAccountResponseBuilder b)]) = _$GetAccountResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetAccountResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetAccountResponse> get serializer => _$GetAccountResponseSerializer();
}

class _$GetAccountResponseSerializer implements PrimitiveSerializer<GetAccountResponse> {
  @override
  final Iterable<Type> types = const [GetAccountResponse, _$GetAccountResponse];

  @override
  final String wireName = r'GetAccountResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetAccountResponse object, {
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
    GetAccountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetAccountResponseBuilder result,
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
  GetAccountResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetAccountResponseBuilder();
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

