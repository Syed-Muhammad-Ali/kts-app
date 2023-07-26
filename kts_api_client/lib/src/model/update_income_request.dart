//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/payment_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_income_request.g.dart';

/// UpdateIncomeRequest
///
/// Properties:
/// * [id] 
/// * [description] 
/// * [amount] 
/// * [paymentMethod] 
/// * [paymentDateTime] 
@BuiltValue()
abstract class UpdateIncomeRequest implements Built<UpdateIncomeRequest, UpdateIncomeRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod? get paymentMethod;
  // enum paymentMethodEnum {  Cash,  Bank,  };

  @BuiltValueField(wireName: r'paymentDateTime')
  DateTime get paymentDateTime;

  UpdateIncomeRequest._();

  factory UpdateIncomeRequest([void updates(UpdateIncomeRequestBuilder b)]) = _$UpdateIncomeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIncomeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIncomeRequest> get serializer => _$UpdateIncomeRequestSerializer();
}

class _$UpdateIncomeRequestSerializer implements PrimitiveSerializer<UpdateIncomeRequest> {
  @override
  final Iterable<Type> types = const [UpdateIncomeRequest, _$UpdateIncomeRequest];

  @override
  final String wireName = r'UpdateIncomeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIncomeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
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
    UpdateIncomeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIncomeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
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
  UpdateIncomeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIncomeRequestBuilder();
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

