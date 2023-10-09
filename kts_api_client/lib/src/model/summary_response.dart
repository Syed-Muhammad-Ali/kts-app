//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kts_booking_api/src/model/expense_dto.dart';
import 'package:kts_booking_api/src/model/income_dto.dart';

part 'summary_response.g.dart';


/// SummaryResponse
///
/// Properties:
/// * [revenue] 
/// * [expenses] 
/// * [taxLiability] 
/// * [total_yearly_expenses] 
/// * [total_yearly_revenues] 
/// * [total_monthly_expenses] 
/// * [total_monthly_revenues] 

@BuiltValue()
abstract class SummaryResponse implements Built<SummaryResponse, SummaryResponseBuilder> {
  @BuiltValueField(wireName: r'expenses')
  BuiltList<ExpenseDto>? get expenses;

  // @BuiltValueField(wireName: r'revenue')
  // BuiltList<IncomeDto>? get revenue;

  @BuiltValueField(wireName: r'taxLiability')
  num get taxLiability;

  @BuiltValueField(wireName: r'total_yearly_expenses')
  num get total_yearly_expenses;
 
  @BuiltValueField(wireName: r'total_yearly_revenues')
  num get total_yearly_revenues;

  @BuiltValueField(wireName: r'total_monthly_expenses')
  num get total_monthly_expenses;

  @BuiltValueField(wireName: r'total_monthly_revenues')
  num get total_monthly_revenues;


  SummaryResponse._();

  factory SummaryResponse([void updates(SummaryResponseBuilder b)]) = _$SummaryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SummaryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SummaryResponse> get serializer => _$SummaryResponseSerializer();
}

class _$SummaryResponseSerializer implements PrimitiveSerializer<SummaryResponse> {
  @override
  final Iterable<Type> types = const [SummaryResponse, _$SummaryResponse];

  @override
  final String wireName = r'SummaryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SummaryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.expenses != null) {
      yield r'expenses';
      yield serializers.serialize(
        object.expenses,
        specifiedType: const FullType(BuiltList, [FullType(ExpenseDto)]),
      );
    }
    // if (object.revenue != null) {
    //   yield r'revenue';
    //   yield serializers.serialize(
    //     object.revenue,
    //     specifiedType: const FullType(BuiltList, [FullType(IncomeDto)]),
    //   );
    // }
    yield r'taxLiability';
    yield serializers.serialize(
      object.taxLiability,
      specifiedType: const FullType(num),
    );
     yield r'total_yearly_expenses';
    yield serializers.serialize(
      object.total_yearly_expenses,
      specifiedType: const FullType(num),
    );
     yield r'total_yearly_revenues';
    yield serializers.serialize(
      object.total_yearly_revenues,
      specifiedType: const FullType(num),
    );
     yield r'total_monthly_expenses';
    yield serializers.serialize(
      object.total_monthly_expenses,
      specifiedType: const FullType(num),
    );
     yield r'total_monthly_revenues';
    yield serializers.serialize(
      object.total_monthly_revenues,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SummaryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SummaryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExpenseDto)]),
          ) as BuiltList<ExpenseDto>;
          result.expenses.replace(valueDes);
          break;
          // case r'revenue':
          // final valueDes = serializers.deserialize(
          //   value,
          //   specifiedType: const FullType(BuiltList, [FullType(IncomeDto)]),
          // ) as BuiltList<IncomeDto>;
          // result.expenses.replace(valueDes);
          // break;
        case r'taxLiability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxLiability = valueDes;
          break;  
        case r'total_yearly_expenses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total_yearly_expenses = valueDes;
          break; 
        case r'total_yearly_revenues':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total_yearly_revenues = valueDes;
          break;  
        case r'total_monthly_expenses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total_monthly_expenses = valueDes;
          break;  
        case r'total_monthly_revenues':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total_monthly_revenues = valueDes;
          break;  
       
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SummaryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SummaryResponseBuilder();
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

