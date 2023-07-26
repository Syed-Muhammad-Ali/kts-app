//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/country.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'address_dto.g.dart';

/// AddressDto
///
/// Properties:
/// * [addressLine1] 
/// * [addressLine2] 
/// * [postcode] 
/// * [town] 
/// * [county] 
/// * [country] 
@BuiltValue()
abstract class AddressDto implements Built<AddressDto, AddressDtoBuilder> {
  @BuiltValueField(wireName: r'addressLine1')
  String? get addressLine1;

  @BuiltValueField(wireName: r'addressLine2')
  String? get addressLine2;

  @BuiltValueField(wireName: r'postcode')
  String? get postcode;

  @BuiltValueField(wireName: r'town')
  String? get town;

  @BuiltValueField(wireName: r'county')
  String? get county;

  @BuiltValueField(wireName: r'country')
  Country get country;
  // enum countryEnum {  EnglandAndNorthernIreland,  Scotland,  Wales,  };

  AddressDto._();

  factory AddressDto([void updates(AddressDtoBuilder b)]) = _$AddressDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddressDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddressDto> get serializer => _$AddressDtoSerializer();
}

class _$AddressDtoSerializer implements PrimitiveSerializer<AddressDto> {
  @override
  final Iterable<Type> types = const [AddressDto, _$AddressDto];

  @override
  final String wireName = r'AddressDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddressDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.addressLine1 != null) {
      yield r'addressLine1';
      yield serializers.serialize(
        object.addressLine1,
        specifiedType: const FullType(String),
      );
    }
    if (object.addressLine2 != null) {
      yield r'addressLine2';
      yield serializers.serialize(
        object.addressLine2,
        specifiedType: const FullType(String),
      );
    }
    if (object.postcode != null) {
      yield r'postcode';
      yield serializers.serialize(
        object.postcode,
        specifiedType: const FullType(String),
      );
    }
    if (object.town != null) {
      yield r'town';
      yield serializers.serialize(
        object.town,
        specifiedType: const FullType(String),
      );
    }
    if (object.county != null) {
      yield r'county';
      yield serializers.serialize(
        object.county,
        specifiedType: const FullType(String),
      );
    }
    yield r'country';
    yield serializers.serialize(
      object.country,
      specifiedType: const FullType(Country),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddressDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddressDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'addressLine1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine1 = valueDes;
          break;
        case r'addressLine2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine2 = valueDes;
          break;
        case r'postcode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.postcode = valueDes;
          break;
        case r'town':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.town = valueDes;
          break;
        case r'county':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.county = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Country),
          ) as Country;
          result.country = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddressDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddressDtoBuilder();
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

