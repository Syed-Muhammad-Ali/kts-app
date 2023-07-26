//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_category_dto.g.dart';

/// ExpenseCategoryDto
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [helpText] 
/// * [helpUrl] 
/// * [placeHolderExampleText] 
@BuiltValue()
abstract class ExpenseCategoryDto implements Built<ExpenseCategoryDto, ExpenseCategoryDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'helpText')
  String? get helpText;

  @BuiltValueField(wireName: r'helpUrl')
  String? get helpUrl;

  @BuiltValueField(wireName: r'placeHolderExampleText')
  String? get placeHolderExampleText;

  ExpenseCategoryDto._();

  factory ExpenseCategoryDto([void updates(ExpenseCategoryDtoBuilder b)]) = _$ExpenseCategoryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseCategoryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseCategoryDto> get serializer => _$ExpenseCategoryDtoSerializer();
}

class _$ExpenseCategoryDtoSerializer implements PrimitiveSerializer<ExpenseCategoryDto> {
  @override
  final Iterable<Type> types = const [ExpenseCategoryDto, _$ExpenseCategoryDto];

  @override
  final String wireName = r'ExpenseCategoryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.helpText != null) {
      yield r'helpText';
      yield serializers.serialize(
        object.helpText,
        specifiedType: const FullType(String),
      );
    }
    if (object.helpUrl != null) {
      yield r'helpUrl';
      yield serializers.serialize(
        object.helpUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.placeHolderExampleText != null) {
      yield r'placeHolderExampleText';
      yield serializers.serialize(
        object.placeHolderExampleText,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseCategoryDtoBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'helpText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.helpText = valueDes;
          break;
        case r'helpUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.helpUrl = valueDes;
          break;
        case r'placeHolderExampleText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.placeHolderExampleText = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpenseCategoryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseCategoryDtoBuilder();
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

