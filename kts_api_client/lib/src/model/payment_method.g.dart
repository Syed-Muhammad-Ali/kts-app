// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PaymentMethod _$cash = const PaymentMethod._('cash');
const PaymentMethod _$bank = const PaymentMethod._('bank');

PaymentMethod _$valueOf(String name) {
  switch (name) {
    case 'cash':
      return _$cash;
    case 'bank':
      return _$bank;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PaymentMethod> _$values =
    new BuiltSet<PaymentMethod>(const <PaymentMethod>[
  _$cash,
  _$bank,
]);

class _$PaymentMethodMeta {
  const _$PaymentMethodMeta();
  PaymentMethod get cash => _$cash;
  PaymentMethod get bank => _$bank;
  PaymentMethod valueOf(String name) => _$valueOf(name);
  BuiltSet<PaymentMethod> get values => _$values;
}

abstract class _$PaymentMethodMixin {
  // ignore: non_constant_identifier_names
  _$PaymentMethodMeta get PaymentMethod => const _$PaymentMethodMeta();
}

Serializer<PaymentMethod> _$paymentMethodSerializer =
    new _$PaymentMethodSerializer();

class _$PaymentMethodSerializer implements PrimitiveSerializer<PaymentMethod> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'cash': 'Cash',
    'bank': 'Bank',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Cash': 'cash',
    'Bank': 'bank',
  };

  @override
  final Iterable<Type> types = const <Type>[PaymentMethod];
  @override
  final String wireName = 'PaymentMethod';

  @override
  Object serialize(Serializers serializers, PaymentMethod object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PaymentMethod deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PaymentMethod.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
