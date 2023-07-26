//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/payment_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment2.g.dart';

/// Payment2
///
/// Properties:
/// * [paymentDateTime] 
/// * [amount] 
/// * [paymentMethod] 
@BuiltValue()
abstract class Payment2 implements Built<Payment2, Payment2Builder> {
  @BuiltValueField(wireName: r'paymentDateTime')
  DateTime get paymentDateTime;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod get paymentMethod;
  // enum paymentMethodEnum {  Cash,  Bank,  };

  Payment2._();

  factory Payment2([void updates(Payment2Builder b)]) = _$Payment2;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(Payment2Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Payment2> get serializer => _$Payment2Serializer();
}

class _$Payment2Serializer implements PrimitiveSerializer<Payment2> {
  @override
  final Iterable<Type> types = const [Payment2, _$Payment2];

  @override
  final String wireName = r'Payment2';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Payment2 object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'paymentDateTime';
    yield serializers.serialize(
      object.paymentDateTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    yield r'paymentMethod';
    yield serializers.serialize(
      object.paymentMethod,
      specifiedType: const FullType(PaymentMethod),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Payment2 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required Payment2Builder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'paymentDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.paymentDateTime = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethod),
          ) as PaymentMethod;
          result.paymentMethod = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Payment2 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = Payment2Builder();
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

