// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Country _$englandAndNorthernIreland =
    const Country._('englandAndNorthernIreland');
const Country _$scotland = const Country._('scotland');
const Country _$wales = const Country._('wales');

Country _$valueOf(String name) {
  switch (name) {
    case 'englandAndNorthernIreland':
      return _$englandAndNorthernIreland;
    case 'scotland':
      return _$scotland;
    case 'wales':
      return _$wales;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Country> _$values = new BuiltSet<Country>(const <Country>[
  _$englandAndNorthernIreland,
  _$scotland,
  _$wales,
]);

class _$CountryMeta {
  const _$CountryMeta();
  Country get englandAndNorthernIreland => _$englandAndNorthernIreland;
  Country get scotland => _$scotland;
  Country get wales => _$wales;
  Country valueOf(String name) => _$valueOf(name);
  BuiltSet<Country> get values => _$values;
}

abstract class _$CountryMixin {
  // ignore: non_constant_identifier_names
  _$CountryMeta get Country => const _$CountryMeta();
}

Serializer<Country> _$countrySerializer = new _$CountrySerializer();

class _$CountrySerializer implements PrimitiveSerializer<Country> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'englandAndNorthernIreland': 'EnglandAndNorthernIreland',
    'scotland': 'Scotland',
    'wales': 'Wales',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'EnglandAndNorthernIreland': 'englandAndNorthernIreland',
    'Scotland': 'scotland',
    'Wales': 'wales',
  };

  @override
  final Iterable<Type> types = const <Type>[Country];
  @override
  final String wireName = 'Country';

  @override
  Object serialize(Serializers serializers, Country object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  Country deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Country.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
