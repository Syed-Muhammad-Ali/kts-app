// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubscriptionType _$standard = const SubscriptionType._('standard');
const SubscriptionType _$premium = const SubscriptionType._('premium');

SubscriptionType _$valueOf(String name) {
  switch (name) {
    case 'standard':
      return _$standard;
    case 'premium':
      return _$premium;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubscriptionType> _$values =
    new BuiltSet<SubscriptionType>(const <SubscriptionType>[
  _$standard,
  _$premium,
]);

class _$SubscriptionTypeMeta {
  const _$SubscriptionTypeMeta();
  SubscriptionType get standard => _$standard;
  SubscriptionType get premium => _$premium;
  SubscriptionType valueOf(String name) => _$valueOf(name);
  BuiltSet<SubscriptionType> get values => _$values;
}

abstract class _$SubscriptionTypeMixin {
  // ignore: non_constant_identifier_names
  _$SubscriptionTypeMeta get SubscriptionType => const _$SubscriptionTypeMeta();
}

Serializer<SubscriptionType> _$subscriptionTypeSerializer =
    new _$SubscriptionTypeSerializer();

class _$SubscriptionTypeSerializer
    implements PrimitiveSerializer<SubscriptionType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'standard': 'Standard',
    'premium': 'Premium',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Standard': 'standard',
    'Premium': 'premium',
  };

  @override
  final Iterable<Type> types = const <Type>[SubscriptionType];
  @override
  final String wireName = 'SubscriptionType';

  @override
  Object serialize(Serializers serializers, SubscriptionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubscriptionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubscriptionType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
