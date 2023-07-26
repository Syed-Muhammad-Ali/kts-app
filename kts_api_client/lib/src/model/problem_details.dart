//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'problem_details.g.dart';

/// ProblemDetails
///
/// Properties:
/// * [type] 
/// * [title] 
/// * [status] 
/// * [detail] 
/// * [instance] 
/// * [extensions] 
@BuiltValue(instantiable: false)
abstract class ProblemDetails  {
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'detail')
  String? get detail;

  @BuiltValueField(wireName: r'instance')
  String? get instance;

  @BuiltValueField(wireName: r'extensions')
  BuiltMap<String, JsonObject> get extensions;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProblemDetails> get serializer => _$ProblemDetailsSerializer();
}

class _$ProblemDetailsSerializer implements PrimitiveSerializer<ProblemDetails> {
  @override
  final Iterable<Type> types = const [ProblemDetails];

  @override
  final String wireName = r'ProblemDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProblemDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(int),
      );
    }
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(String),
      );
    }
    if (object.instance != null) {
      yield r'instance';
      yield serializers.serialize(
        object.instance,
        specifiedType: const FullType(String),
      );
    }
    yield r'extensions';
    yield serializers.serialize(
      object.extensions,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProblemDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  ProblemDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($ProblemDetails)) as $ProblemDetails;
  }
}

/// a concrete implementation of [ProblemDetails], since [ProblemDetails] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ProblemDetails implements ProblemDetails, Built<$ProblemDetails, $ProblemDetailsBuilder> {
  $ProblemDetails._();

  factory $ProblemDetails([void Function($ProblemDetailsBuilder)? updates]) = _$$ProblemDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ProblemDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ProblemDetails> get serializer => _$$ProblemDetailsSerializer();
}

class _$$ProblemDetailsSerializer implements PrimitiveSerializer<$ProblemDetails> {
  @override
  final Iterable<Type> types = const [$ProblemDetails, _$$ProblemDetails];

  @override
  final String wireName = r'$ProblemDetails';

  @override
  Object serialize(
    Serializers serializers,
    $ProblemDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ProblemDetails))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProblemDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.detail = valueDes;
          break;
        case r'instance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.instance = valueDes;
          break;
        case r'extensions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
          ) as BuiltMap<String, JsonObject>;
          result.extensions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $ProblemDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ProblemDetailsBuilder();
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

