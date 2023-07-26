//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/payment_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_expense_request.g.dart';

/// CreateExpenseRequest
///
/// Properties:
/// * [paidDateTime] 
/// * [amount] 
/// * [categoryId] 
/// * [notes] 
/// * [paymentMethod] 
/// * [recieptId] 
/// * [supplier] 
@BuiltValue()
abstract class CreateExpenseRequest implements Built<CreateExpenseRequest, CreateExpenseRequestBuilder> {
  @BuiltValueField(wireName: r'paidDateTime')
  DateTime get paidDateTime;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'categoryId')
  int get categoryId;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod get paymentMethod;
  // enum paymentMethodEnum {  Cash,  Bank,  };

  @BuiltValueField(wireName: r'recieptId')
  int? get recieptId;

  @BuiltValueField(wireName: r'supplier')
  String? get supplier;

  CreateExpenseRequest._();

  factory CreateExpenseRequest([void updates(CreateExpenseRequestBuilder b)]) = _$CreateExpenseRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateExpenseRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateExpenseRequest> get serializer => _$CreateExpenseRequestSerializer();
}

class _$CreateExpenseRequestSerializer implements PrimitiveSerializer<CreateExpenseRequest> {
  @override
  final Iterable<Type> types = const [CreateExpenseRequest, _$CreateExpenseRequest];

  @override
  final String wireName = r'CreateExpenseRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateExpenseRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'paidDateTime';
    yield serializers.serialize(
      object.paidDateTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    yield r'categoryId';
    yield serializers.serialize(
      object.categoryId,
      specifiedType: const FullType(int),
    );
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType(String),
      );
    }
    yield r'paymentMethod';
    yield serializers.serialize(
      object.paymentMethod,
      specifiedType: const FullType(PaymentMethod),
    );
    if (object.recieptId != null) {
      yield r'recieptId';
      yield serializers.serialize(
        object.recieptId,
        specifiedType: const FullType(int),
      );
    }
    if (object.supplier != null) {
      yield r'supplier';
      yield serializers.serialize(
        object.supplier,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateExpenseRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateExpenseRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'paidDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.paidDateTime = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'categoryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.categoryId = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.notes = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethod),
          ) as PaymentMethod;
          result.paymentMethod = valueDes;
          break;
        case r'recieptId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.recieptId = valueDes;
          break;
        case r'supplier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.supplier = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateExpenseRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateExpenseRequestBuilder();
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

