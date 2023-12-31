// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DepositType _$percentage = const DepositType._('percentage');
const DepositType _$fixed = const DepositType._('fixed');

DepositType _$valueOf(String name) {
  switch (name) {
    case 'percentage':
      return _$percentage;
    case 'fixed':
      return _$fixed;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DepositType> _$values =
    new BuiltSet<DepositType>(const <DepositType>[
  _$percentage,
  _$fixed,
]);

class _$DepositTypeMeta {
  const _$DepositTypeMeta();
  DepositType get percentage => _$percentage;
  DepositType get fixed => _$fixed;
  DepositType valueOf(String name) => _$valueOf(name);
  BuiltSet<DepositType> get values => _$values;
}

abstract class _$DepositTypeMixin {
  // ignore: non_constant_identifier_names
  _$DepositTypeMeta get DepositType => const _$DepositTypeMeta();
}

Serializer<DepositType> _$depositTypeSerializer = new _$DepositTypeSerializer();

class _$DepositTypeSerializer implements PrimitiveSerializer<DepositType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'percentage': 'Percentage',
    'fixed': 'Fixed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Percentage': 'percentage',
    'Fixed': 'fixed',
  };

  @override
  final Iterable<Type> types = const <Type>[DepositType];
  @override
  final String wireName = 'DepositType';

  @override
  Object serialize(Serializers serializers, DepositType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DepositType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DepositType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
