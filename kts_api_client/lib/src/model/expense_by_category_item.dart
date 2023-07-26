//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/expense_category_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_by_category_item.g.dart';

/// ExpenseByCategoryItem
///
/// Properties:
/// * [category] 
/// * [total] 
@BuiltValue()
abstract class ExpenseByCategoryItem implements Built<ExpenseByCategoryItem, ExpenseByCategoryItemBuilder> {
  @BuiltValueField(wireName: r'category')
  ExpenseCategoryDto? get category;

  @BuiltValueField(wireName: r'total')
  num get total;

  ExpenseByCategoryItem._();

  factory ExpenseByCategoryItem([void updates(ExpenseByCategoryItemBuilder b)]) = _$ExpenseByCategoryItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseByCategoryItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseByCategoryItem> get serializer => _$ExpenseByCategoryItemSerializer();
}

class _$ExpenseByCategoryItemSerializer implements PrimitiveSerializer<ExpenseByCategoryItem> {
  @override
  final Iterable<Type> types = const [ExpenseByCategoryItem, _$ExpenseByCategoryItem];

  @override
  final String wireName = r'ExpenseByCategoryItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseByCategoryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
        specifiedType: const FullType(ExpenseCategoryDto),
      );
    }
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseByCategoryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseByCategoryItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExpenseCategoryDto),
          ) as ExpenseCategoryDto;
          result.category.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpenseByCategoryItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseByCategoryItemBuilder();
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

