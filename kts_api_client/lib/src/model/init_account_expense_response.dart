//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/expense_category_dto.dart';
import 'package:kts_booking_api/src/model/expense_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_account_expense_response.g.dart';

/// InitAccountExpenseResponse
///
/// Properties:
/// * [expenseCategories] 
/// * [expense] 
@BuiltValue()
abstract class InitAccountExpenseResponse implements Built<InitAccountExpenseResponse, InitAccountExpenseResponseBuilder> {
  @BuiltValueField(wireName: r'expenseCategories')
  BuiltList<ExpenseCategoryDto>? get expenseCategories;

  @BuiltValueField(wireName: r'expense')
  ExpenseDto? get expense;

  InitAccountExpenseResponse._();

  factory InitAccountExpenseResponse([void updates(InitAccountExpenseResponseBuilder b)]) = _$InitAccountExpenseResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAccountExpenseResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAccountExpenseResponse> get serializer => _$InitAccountExpenseResponseSerializer();
}

class _$InitAccountExpenseResponseSerializer implements PrimitiveSerializer<InitAccountExpenseResponse> {
  @override
  final Iterable<Type> types = const [InitAccountExpenseResponse, _$InitAccountExpenseResponse];

  @override
  final String wireName = r'InitAccountExpenseResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAccountExpenseResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.expenseCategories != null) {
      yield r'expenseCategories';
      yield serializers.serialize(
        object.expenseCategories,
        specifiedType: const FullType(BuiltList, [FullType(ExpenseCategoryDto)]),
      );
    }
    if (object.expense != null) {
      yield r'expense';
      yield serializers.serialize(
        object.expense,
        specifiedType: const FullType(ExpenseDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAccountExpenseResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAccountExpenseResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseCategories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExpenseCategoryDto)]),
          ) as BuiltList<ExpenseCategoryDto>;
          result.expenseCategories.replace(valueDes);
          break;
        case r'expense':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExpenseDto),
          ) as ExpenseDto;
          result.expense.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAccountExpenseResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAccountExpenseResponseBuilder();
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

