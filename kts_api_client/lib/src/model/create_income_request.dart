//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/payment_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_income_request.g.dart';

/// CreateIncomeRequest
///
/// Properties:
/// * [amount] 
/// * [description] 
/// * [paymentMethod] 
/// * [paymentDateTime] 
@BuiltValue()
abstract class CreateIncomeRequest implements Built<CreateIncomeRequest, CreateIncomeRequestBuilder> {
  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod? get paymentMethod;
  // enum paymentMethodEnum {  Cash,  Bank,  };

  @BuiltValueField(wireName: r'paymentDateTime')
  DateTime get paymentDateTime;

  CreateIncomeRequest._();

  factory CreateIncomeRequest([void updates(CreateIncomeRequestBuilder b)]) = _$CreateIncomeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateIncomeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateIncomeRequest> get serializer => _$CreateIncomeRequestSerializer();
}

class _$CreateIncomeRequestSerializer implements PrimitiveSerializer<CreateIncomeRequest> {
  @override
  final Iterable<Type> types = const [CreateIncomeRequest, _$CreateIncomeRequest];

  @override
  final String wireName = r'CreateIncomeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateIncomeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.paymentMethod != null) {
      yield r'paymentMethod';
      yield serializers.serialize(
        object.paymentMethod,
        specifiedType: const FullType(PaymentMethod),
      );
    }
    yield r'paymentDateTime';
    yield serializers.serialize(
      object.paymentDateTime,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateIncomeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateIncomeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethod),
          ) as PaymentMethod;
          result.paymentMethod = valueDes;
          break;
        case r'paymentDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.paymentDateTime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateIncomeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateIncomeRequestBuilder();
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

