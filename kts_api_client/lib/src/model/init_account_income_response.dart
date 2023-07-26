//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/income_dto.dart';
import 'package:kts_booking_api/src/model/accouting_period_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_account_income_response.g.dart';

/// InitAccountIncomeResponse
///
/// Properties:
/// * [accountingPeriod] 
/// * [income] 
@BuiltValue()
abstract class InitAccountIncomeResponse implements Built<InitAccountIncomeResponse, InitAccountIncomeResponseBuilder> {
  @BuiltValueField(wireName: r'accountingPeriod')
  AccoutingPeriodDto? get accountingPeriod;

  @BuiltValueField(wireName: r'income')
  IncomeDto? get income;

  InitAccountIncomeResponse._();

  factory InitAccountIncomeResponse([void updates(InitAccountIncomeResponseBuilder b)]) = _$InitAccountIncomeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitAccountIncomeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitAccountIncomeResponse> get serializer => _$InitAccountIncomeResponseSerializer();
}

class _$InitAccountIncomeResponseSerializer implements PrimitiveSerializer<InitAccountIncomeResponse> {
  @override
  final Iterable<Type> types = const [InitAccountIncomeResponse, _$InitAccountIncomeResponse];

  @override
  final String wireName = r'InitAccountIncomeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitAccountIncomeResponse object, {
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
        specifiedType: const FullType(IncomeDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitAccountIncomeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitAccountIncomeResponseBuilder result,
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
            specifiedType: const FullType(IncomeDto),
          ) as IncomeDto;
          result.income.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitAccountIncomeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitAccountIncomeResponseBuilder();
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

