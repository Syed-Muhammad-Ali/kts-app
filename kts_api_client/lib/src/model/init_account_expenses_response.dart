//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/accouting_period_dto.dart';
import 'package:kts_booking_api/src/model/expense_category_dto.dart';
import 'package:kts_booking_api/src/model/expense_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_account_expenses_response.g.dart';

/// InitAccountExpensesResponse
///
/// Properties:
/// * [accountingPeriod] 
/// * [totalExpenseSum] 
/// * [expenses] 
/// * [category] 
@BuiltValue()
abstract class InitAccountExpensesResponse implements Built<InitAccountExpensesResponse, InitAccountExpensesResponseBuilder> {
  @BuiltValueField(wireName: r'accountingPeriod')
  AccoutingPeriodDto? get accountingPeriod;

  @BuiltValueField(wireName: r'totalExpenseSum')
  num get totalExpenseSum;

  @BuiltValueField(wireName: r'expenses')
  BuiltList<ExpenseDto>? get expenses;

  @BuiltValueField(wireName: r'category')
  ExpenseCategoryDto? get category;

  InitAccountExpensesResponse._();

  factory InitAccountExpensesResponse([void updates(InitAccountExpensesResponseBuilder b)]) = _$InitAccountExpensesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAccountExpensesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAccountExpensesResponse> get serializer => _$InitAccountExpensesResponseSerializer();
}

class _$InitAccountExpensesResponseSerializer implements PrimitiveSerializer<InitAccountExpensesResponse> {
  @override
  final Iterable<Type> types = const [InitAccountExpensesResponse, _$InitAccountExpensesResponse];

  @override
  final String wireName = r'InitAccountExpensesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAccountExpensesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.accountingPeriod != null) {
      yield r'accountingPeriod';
      yield serializers.serialize(
        object.accountingPeriod,
        specifiedType: const FullType(AccoutingPeriodDto),
      );
    }
    yield r'totalExpenseSum';
    yield serializers.serialize(
      object.totalExpenseSum,
      specifiedType: const FullType(num),
    );
    if (object.expenses != null) {
      yield r'expenses';
      yield serializers.serialize(
        object.expenses,
        specifiedType: const FullType(BuiltList, [FullType(ExpenseDto)]),
      );
    }
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
        specifiedType: const FullType(ExpenseCategoryDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAccountExpensesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAccountExpensesResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accountingPeriod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccoutingPeriodDto),
          ) as AccoutingPeriodDto;
          result.accountingPeriod.replace(valueDes);
          break;
        case r'totalExpenseSum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalExpenseSum = valueDes;
          break;
        case r'expenses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExpenseDto)]),
          ) as BuiltList<ExpenseDto>;
          result.expenses.replace(valueDes);
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExpenseCategoryDto),
          ) as ExpenseCategoryDto;
          result.category.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAccountExpensesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAccountExpensesResponseBuilder();
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

