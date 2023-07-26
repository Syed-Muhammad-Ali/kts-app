//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/bk_user_dto.dart';
import 'package:kts_booking_api/src/model/address_dto.dart';
import 'package:kts_booking_api/src/model/subscription_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_dto.g.dart';

/// AccountDto
///
/// Properties:
/// * [nationalInsuranceNumber] 
/// * [name] 
/// * [address] 
/// * [dateOfBirth] 
/// * [utr] 
/// * [annualEmploymentIncome] 
/// * [subscriptionType] 
/// * [user] 
/// * [appStoreUserId] 
/// * [isTestAccount] 
@BuiltValue()
abstract class AccountDto implements Built<AccountDto, AccountDtoBuilder> {
  @BuiltValueField(wireName: r'nationalInsuranceNumber')
  String? get nationalInsuranceNumber;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'address')
  AddressDto? get address;

  @BuiltValueField(wireName: r'dateOfBirth')
  DateTime? get dateOfBirth;

  @BuiltValueField(wireName: r'utr')
  String? get utr;

  @BuiltValueField(wireName: r'annualEmploymentIncome')
  num? get annualEmploymentIncome;

  @BuiltValueField(wireName: r'subscriptionType')
  SubscriptionType get subscriptionType;
  // enum subscriptionTypeEnum {  Standard,  Premium,  };

  @BuiltValueField(wireName: r'user')
  BkUserDto? get user;

  @BuiltValueField(wireName: r'appStoreUserId')
  String? get appStoreUserId;

  @BuiltValueField(wireName: r'isTestAccount')
  bool get isTestAccount;

  AccountDto._();

  factory AccountDto([void updates(AccountDtoBuilder b)]) = _$AccountDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountDto> get serializer => _$AccountDtoSerializer();
}

class _$AccountDtoSerializer implements PrimitiveSerializer<AccountDto> {
  @override
  final Iterable<Type> types = const [AccountDto, _$AccountDto];

  @override
  final String wireName = r'AccountDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nationalInsuranceNumber != null) {
      yield r'nationalInsuranceNumber';
      yield serializers.serialize(
        object.nationalInsuranceNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(AddressDto),
      );
    }
    if (object.dateOfBirth != null) {
      yield r'dateOfBirth';
      yield serializers.serialize(
        object.dateOfBirth,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.utr != null) {
      yield r'utr';
      yield serializers.serialize(
        object.utr,
        specifiedType: const FullType(String),
      );
    }
    if (object.annualEmploymentIncome != null) {
      yield r'annualEmploymentIncome';
      yield serializers.serialize(
        object.annualEmploymentIncome,
        specifiedType: const FullType(num),
      );
    }
    yield r'subscriptionType';
    yield serializers.serialize(
      object.subscriptionType,
      specifiedType: const FullType(SubscriptionType),
    );
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType(BkUserDto),
      );
    }
    if (object.appStoreUserId != null) {
      yield r'appStoreUserId';
      yield serializers.serialize(
        object.appStoreUserId,
        specifiedType: const FullType(String),
      );
    }
    yield r'isTestAccount';
    yield serializers.serialize(
      object.isTestAccount,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AccountDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nationalInsuranceNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nationalInsuranceNumber = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddressDto),
          ) as AddressDto;
          result.address.replace(valueDes);
          break;
        case r'dateOfBirth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.dateOfBirth = valueDes;
          break;
        case r'utr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.utr = valueDes;
          break;
        case r'annualEmploymentIncome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.annualEmploymentIncome = valueDes;
          break;
        case r'subscriptionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionType),
          ) as SubscriptionType;
          result.subscriptionType = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BkUserDto),
          ) as BkUserDto;
          result.user.replace(valueDes);
          break;
        case r'appStoreUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appStoreUserId = valueDes;
          break;
        case r'isTestAccount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isTestAccount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountDtoBuilder();
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

