//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'deposit_type.g.dart';

class DepositType extends EnumClass {

  /// 
  @BuiltValueEnumConst(wireName: r'Percentage')
  static const DepositType percentage = _$percentage;
  /// 
  @BuiltValueEnumConst(wireName: r'Fixed')
  static const DepositType fixed = _$fixed;

  static Serializer<DepositType> get serializer => _$depositTypeSerializer;

  const DepositType._(String name): super(name);

  static BuiltSet<DepositType> get values => _$values;
  static DepositType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DepositTypeMixin = Object with _$DepositTypeMixin;

