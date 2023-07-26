//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'country.g.dart';

class Country extends EnumClass {

  /// 
  @BuiltValueEnumConst(wireName: r'EnglandAndNorthernIreland')
  static const Country englandAndNorthernIreland = _$englandAndNorthernIreland;
  /// 
  @BuiltValueEnumConst(wireName: r'Scotland')
  static const Country scotland = _$scotland;
  /// 
  @BuiltValueEnumConst(wireName: r'Wales')
  static const Country wales = _$wales;

  static Serializer<Country> get serializer => _$countrySerializer;

  const Country._(String name): super(name);

  static BuiltSet<Country> get values => _$values;
  static Country valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CountryMixin = Object with _$CountryMixin;

