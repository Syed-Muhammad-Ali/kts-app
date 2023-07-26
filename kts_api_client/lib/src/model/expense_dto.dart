//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/payment_method.dart';
import 'package:kts_booking_api/src/model/file_dto.dart';
import 'package:kts_booking_api/src/model/expense_category_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_dto.g.dart';

/// ExpenseDto
///
/// Properties:
/// * [amount] 
/// * [category] 
/// * [id] 
/// * [notes] 
/// * [paymentMethod] 
/// * [paidDateTime] 
/// * [supplier] 
/// * [receipt] 
@BuiltValue()
abstract class ExpenseDto implements Built<ExpenseDto, ExpenseDtoBuilder> {
  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'category')
  ExpenseCategoryDto? get category;

  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod get paymentMethod;
  // enum paymentMethodEnum {  Cash,  Bank,  };

  @BuiltValueField(wireName: r'paidDateTime')
  DateTime get paidDateTime;

  @BuiltValueField(wireName: r'supplier')
  String? get supplier;

  @BuiltValueField(wireName: r'receipt')
  FileDto? get receipt;

  ExpenseDto._();

  factory ExpenseDto([void updates(ExpenseDtoBuilder b)]) = _$ExpenseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseDto> get serializer => _$ExpenseDtoSerializer();
}

class _$ExpenseDtoSerializer implements PrimitiveSerializer<ExpenseDto> {
  @override
  final Iterable<Type> types = const [ExpenseDto, _$ExpenseDto];

  @override
  final String wireName = r'ExpenseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
        specifiedType: const FullType(ExpenseCategoryDto),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'paidDateTime';
    yield serializers.serialize(
      object.paidDateTime,
      specifiedType: const FullType(DateTime),
    );
    if (object.supplier != null) {
      yield r'supplier';
      yield serializers.serialize(
        object.supplier,
        specifiedType: const FullType(String),
      );
    }
    if (object.receipt != null) {
      yield r'receipt';
      yield serializers.serialize(
        object.receipt,
        specifiedType: const FullType(FileDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseDtoBuilder result,
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
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExpenseCategoryDto),
          ) as ExpenseCategoryDto;
          result.category.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
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
        case r'paidDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.paidDateTime = valueDes;
          break;
        case r'supplier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.supplier = valueDes;
          break;
        case r'receipt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FileDto),
          ) as FileDto;
          result.receipt.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpenseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseDtoBuilder();
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

