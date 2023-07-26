//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/accounting_period_overview_stats.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accounting_period_overview_response.g.dart';

/// AccountingPeriodOverviewResponse
///
/// Properties:
/// * [current] 
/// * [forecasted] 
@BuiltValue()
abstract class AccountingPeriodOverviewResponse implements Built<AccountingPeriodOverviewResponse, AccountingPeriodOverviewResponseBuilder> {
  @BuiltValueField(wireName: r'current')
  AccountingPeriodOverviewStats? get current;

  @BuiltValueField(wireName: r'forecasted')
  AccountingPeriodOverviewStats? get forecasted;

  AccountingPeriodOverviewResponse._();

  factory AccountingPeriodOverviewResponse([void updates(AccountingPeriodOverviewResponseBuilder b)]) = _$AccountingPeriodOverviewResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountingPeriodOverviewResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountingPeriodOverviewResponse> get serializer => _$AccountingPeriodOverviewResponseSerializer();
}

class _$AccountingPeriodOverviewResponseSerializer implements PrimitiveSerializer<AccountingPeriodOverviewResponse> {
  @override
  final Iterable<Type> types = const [AccountingPeriodOverviewResponse, _$AccountingPeriodOverviewResponse];

  @override
  final String wireName = r'AccountingPeriodOverviewResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountingPeriodOverviewResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.current != null) {
      yield r'current';
      yield serializers.serialize(
        object.current,
        specifiedType: const FullType(AccountingPeriodOverviewStats),
      );
    }
    if (object.forecasted != null) {
      yield r'forecasted';
      yield serializers.serialize(
        object.forecasted,
        specifiedType: const FullType(AccountingPeriodOverviewStats),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountingPeriodOverviewResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AccountingPeriodOverviewResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'current':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccountingPeriodOverviewStats),
          ) as AccountingPeriodOverviewStats;
          result.current.replace(valueDes);
          break;
        case r'forecasted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccountingPeriodOverviewStats),
          ) as AccountingPeriodOverviewStats;
          result.forecasted.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountingPeriodOverviewResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountingPeriodOverviewResponseBuilder();
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

