//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accouting_period_dto.g.dart';

/// AccoutingPeriodDto
///
/// Properties:
/// * [id] 
/// * [periodStartDate] 
/// * [periodEndDate] 
@BuiltValue()
abstract class AccoutingPeriodDto implements Built<AccoutingPeriodDto, AccoutingPeriodDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'periodStartDate')
  DateTime get periodStartDate;

  @BuiltValueField(wireName: r'periodEndDate')
  DateTime get periodEndDate;

  AccoutingPeriodDto._();

  factory AccoutingPeriodDto([void updates(AccoutingPeriodDtoBuilder b)]) = _$AccoutingPeriodDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccoutingPeriodDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccoutingPeriodDto> get serializer => _$AccoutingPeriodDtoSerializer();
}

class _$AccoutingPeriodDtoSerializer implements PrimitiveSerializer<AccoutingPeriodDto> {
  @override
  final Iterable<Type> types = const [AccoutingPeriodDto, _$AccoutingPeriodDto];

  @override
  final String wireName = r'AccoutingPeriodDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccoutingPeriodDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'periodStartDate';
    yield serializers.serialize(
      object.periodStartDate,
      specifiedType: const FullType(DateTime),
    );
    yield r'periodEndDate';
    yield serializers.serialize(
      object.periodEndDate,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AccoutingPeriodDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AccoutingPeriodDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'periodStartDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.periodStartDate = valueDes;
          break;
        case r'periodEndDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.periodEndDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccoutingPeriodDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccoutingPeriodDtoBuilder();
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

