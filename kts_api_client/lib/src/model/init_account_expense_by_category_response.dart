//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/expense_by_category_item.dart';
import 'package:kts_booking_api/src/model/accouting_period_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_account_expense_by_category_response.g.dart';

/// InitAccountExpenseByCategoryResponse
///
/// Properties:
/// * [period] 
/// * [expenseByCategories] 
@BuiltValue()
abstract class InitAccountExpenseByCategoryResponse implements Built<InitAccountExpenseByCategoryResponse, InitAccountExpenseByCategoryResponseBuilder> {
  @BuiltValueField(wireName: r'period')
  AccoutingPeriodDto? get period;

  @BuiltValueField(wireName: r'expenseByCategories')
  BuiltList<ExpenseByCategoryItem>? get expenseByCategories;

  InitAccountExpenseByCategoryResponse._();

  factory InitAccountExpenseByCategoryResponse([void updates(InitAccountExpenseByCategoryResponseBuilder b)]) = _$InitAccountExpenseByCategoryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAccountExpenseByCategoryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAccountExpenseByCategoryResponse> get serializer => _$InitAccountExpenseByCategoryResponseSerializer();
}

class _$InitAccountExpenseByCategoryResponseSerializer implements PrimitiveSerializer<InitAccountExpenseByCategoryResponse> {
  @override
  final Iterable<Type> types = const [InitAccountExpenseByCategoryResponse, _$InitAccountExpenseByCategoryResponse];

  @override
  final String wireName = r'InitAccountExpenseByCategoryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAccountExpenseByCategoryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.period != null) {
      yield r'period';
      yield serializers.serialize(
        object.period,
        specifiedType: const FullType(AccoutingPeriodDto),
      );
    }
    if (object.expenseByCategories != null) {
      yield r'expenseByCategories';
      yield serializers.serialize(
        object.expenseByCategories,
        specifiedType: const FullType(BuiltList, [FullType(ExpenseByCategoryItem)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAccountExpenseByCategoryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAccountExpenseByCategoryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'period':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccoutingPeriodDto),
          ) as AccoutingPeriodDto;
          result.period.replace(valueDes);
          break;
        case r'expenseByCategories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExpenseByCategoryItem)]),
          ) as BuiltList<ExpenseByCategoryItem>;
          result.expenseByCategories.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAccountExpenseByCategoryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAccountExpenseByCategoryResponseBuilder();
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

