//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/income_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/accouting_period_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_account_incomes_response.g.dart';

/// InitAccountIncomesResponse
///
/// Properties:
/// * [accountingPeriod] 
/// * [income] 
/// * [totalIncomeSum] 
@BuiltValue()
abstract class InitAccountIncomesResponse implements Built<InitAccountIncomesResponse, InitAccountIncomesResponseBuilder> {
  @BuiltValueField(wireName: r'accountingPeriod')
  AccoutingPeriodDto? get accountingPeriod;

  @BuiltValueField(wireName: r'income')
  BuiltList<IncomeDto>? get income;

  @BuiltValueField(wireName: r'totalIncomeSum')
  num get totalIncomeSum;

  InitAccountIncomesResponse._();

  factory InitAccountIncomesResponse([void updates(InitAccountIncomesResponseBuilder b)]) = _$InitAccountIncomesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAccountIncomesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAccountIncomesResponse> get serializer => _$InitAccountIncomesResponseSerializer();
}

class _$InitAccountIncomesResponseSerializer implements PrimitiveSerializer<InitAccountIncomesResponse> {
  @override
  final Iterable<Type> types = const [InitAccountIncomesResponse, _$InitAccountIncomesResponse];

  @override
  final String wireName = r'InitAccountIncomesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAccountIncomesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.accountingPeriod != null) {
      yield r'accountingPeriod';
      yield serializers.serialize(
        object.accountingPeriod,
        specifiedType: const FullType(AccoutingPeriodDto),
      );
    }
    if (object.income != null) {
      yield r'income';
      yield serializers.serialize(
        object.income,
        specifiedType: const FullType(BuiltList, [FullType(IncomeDto)]),
      );
    }
    yield r'totalIncomeSum';
    yield serializers.serialize(
      object.totalIncomeSum,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAccountIncomesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAccountIncomesResponseBuilder result,
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
        case r'income':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(IncomeDto)]),
          ) as BuiltList<IncomeDto>;
          result.income.replace(valueDes);
          break;
        case r'totalIncomeSum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalIncomeSum = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAccountIncomesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAccountIncomesResponseBuilder();
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

