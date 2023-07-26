//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/address_dto.dart';
import 'package:kts_booking_api/src/model/subscription_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'signup_request.g.dart';

/// SignupRequest
///
/// Properties:
/// * [nino] 
/// * [email] 
/// * [password] 
/// * [name] 
/// * [address] 
/// * [dateOfBirth] 
/// * [utr] 
/// * [annualEmploymentIncome] 
/// * [subscriptionType] 
/// * [appStoreId] 
@BuiltValue()
abstract class SignupRequest implements Built<SignupRequest, SignupRequestBuilder> {
  @BuiltValueField(wireName: r'nino')
  String? get nino;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'address')
  AddressDto? get address;

  @BuiltValueField(wireName: r'dateOfBirth')
  DateTime get dateOfBirth;

  @BuiltValueField(wireName: r'utr')
  String? get utr;

  @BuiltValueField(wireName: r'annualEmploymentIncome')
  num get annualEmploymentIncome;

  @BuiltValueField(wireName: r'subscriptionType')
  SubscriptionType? get subscriptionType;
  // enum subscriptionTypeEnum {  Standard,  Premium,  };

  @BuiltValueField(wireName: r'appStoreId')
  String? get appStoreId;

  SignupRequest._();

  factory SignupRequest([void updates(SignupRequestBuilder b)]) = _$SignupRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SignupRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SignupRequest> get serializer => _$SignupRequestSerializer();
}

class _$SignupRequestSerializer implements PrimitiveSerializer<SignupRequest> {
  @override
  final Iterable<Type> types = const [SignupRequest, _$SignupRequest];

  @override
  final String wireName = r'SignupRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SignupRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nino != null) {
      yield r'nino';
      yield serializers.serialize(
        object.nino,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
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
    yield r'dateOfBirth';
    yield serializers.serialize(
      object.dateOfBirth,
      specifiedType: const FullType(DateTime),
    );
    if (object.utr != null) {
      yield r'utr';
      yield serializers.serialize(
        object.utr,
        specifiedType: const FullType(String),
      );
    }
    yield r'annualEmploymentIncome';
    yield serializers.serialize(
      object.annualEmploymentIncome,
      specifiedType: const FullType(num),
    );
    if (object.subscriptionType != null) {
      yield r'subscriptionType';
      yield serializers.serialize(
        object.subscriptionType,
        specifiedType: const FullType(SubscriptionType),
      );
    }
    if (object.appStoreId != null) {
      yield r'appStoreId';
      yield serializers.serialize(
        object.appStoreId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SignupRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SignupRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nino':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nino = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
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
        case r'appStoreId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appStoreId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SignupRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SignupRequestBuilder();
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

