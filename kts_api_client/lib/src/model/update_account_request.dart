//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/address_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_request.g.dart';

/// UpdateAccountRequest
///
/// Properties:
/// * [email] 
/// * [nino] 
/// * [name] 
/// * [address] 
/// * [dateOfBirth] 
/// * [utr] 
/// * [annualEmploymentIncome] 
@BuiltValue()
abstract class UpdateAccountRequest implements Built<UpdateAccountRequest, UpdateAccountRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'nino')
  String? get nino;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'address')
  AddressDto? get address;

  @BuiltValueField(wireName: r'dateOfBirth')
  DateTime? get dateOfBirth;

  @BuiltValueField(wireName: r'utr')
  String? get utr;

  @BuiltValueField(wireName: r'annualEmploymentIncome')
  num get annualEmploymentIncome;

  UpdateAccountRequest._();

  factory UpdateAccountRequest([void updates(UpdateAccountRequestBuilder b)]) = _$UpdateAccountRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAccountRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAccountRequest> get serializer => _$UpdateAccountRequestSerializer();
}

class _$UpdateAccountRequestSerializer implements PrimitiveSerializer<UpdateAccountRequest> {
  @override
  final Iterable<Type> types = const [UpdateAccountRequest, _$UpdateAccountRequest];

  @override
  final String wireName = r'UpdateAccountRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAccountRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.nino != null) {
      yield r'nino';
      yield serializers.serialize(
        object.nino,
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
    yield r'annualEmploymentIncome';
    yield serializers.serialize(
      object.annualEmploymentIncome,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateAccountRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAccountRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'nino':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nino = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateAccountRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAccountRequestBuilder();
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

