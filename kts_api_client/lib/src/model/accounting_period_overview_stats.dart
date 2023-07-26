//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accounting_period_overview_stats.g.dart';

/// AccountingPeriodOverviewStats
///
/// Properties:
/// * [revenue] 
/// * [expenses] 
/// * [profit] 
/// * [taxLiability] 
/// * [nic] 
@BuiltValue()
abstract class AccountingPeriodOverviewStats implements Built<AccountingPeriodOverviewStats, AccountingPeriodOverviewStatsBuilder> {
  @BuiltValueField(wireName: r'revenue')
  num get revenue;

  @BuiltValueField(wireName: r'expenses')
  num get expenses;

  @BuiltValueField(wireName: r'profit')
  num get profit;

  @BuiltValueField(wireName: r'taxLiability')
  num get taxLiability;

  @BuiltValueField(wireName: r'nic')
  num get nic;

  AccountingPeriodOverviewStats._();

  factory AccountingPeriodOverviewStats([void updates(AccountingPeriodOverviewStatsBuilder b)]) = _$AccountingPeriodOverviewStats;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountingPeriodOverviewStatsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountingPeriodOverviewStats> get serializer => _$AccountingPeriodOverviewStatsSerializer();
}

class _$AccountingPeriodOverviewStatsSerializer implements PrimitiveSerializer<AccountingPeriodOverviewStats> {
  @override
  final Iterable<Type> types = const [AccountingPeriodOverviewStats, _$AccountingPeriodOverviewStats];

  @override
  final String wireName = r'AccountingPeriodOverviewStats';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountingPeriodOverviewStats object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'revenue';
    yield serializers.serialize(
      object.revenue,
      specifiedType: const FullType(num),
    );
    yield r'expenses';
    yield serializers.serialize(
      object.expenses,
      specifiedType: const FullType(num),
    );
    yield r'profit';
    yield serializers.serialize(
      object.profit,
      specifiedType: const FullType(num),
    );
    yield r'taxLiability';
    yield serializers.serialize(
      object.taxLiability,
      specifiedType: const FullType(num),
    );
    yield r'nic';
    yield serializers.serialize(
      object.nic,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountingPeriodOverviewStats object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AccountingPeriodOverviewStatsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'revenue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.revenue = valueDes;
          break;
        case r'expenses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.expenses = valueDes;
          break;
        case r'profit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.profit = valueDes;
          break;
        case r'taxLiability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxLiability = valueDes;
          break;
        case r'nic':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.nic = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountingPeriodOverviewStats deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountingPeriodOverviewStatsBuilder();
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

