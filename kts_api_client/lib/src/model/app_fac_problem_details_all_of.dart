//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_fac_problem_details_all_of.g.dart';

/// AppFacProblemDetailsAllOf
///
/// Properties:
/// * [errors] 
@BuiltValue(instantiable: false)
abstract class AppFacProblemDetailsAllOf  {
  @BuiltValueField(wireName: r'errors')
  BuiltList<String> get errors;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppFacProblemDetailsAllOf> get serializer => _$AppFacProblemDetailsAllOfSerializer();
}

class _$AppFacProblemDetailsAllOfSerializer implements PrimitiveSerializer<AppFacProblemDetailsAllOf> {
  @override
  final Iterable<Type> types = const [AppFacProblemDetailsAllOf];

  @override
  final String wireName = r'AppFacProblemDetailsAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppFacProblemDetailsAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'errors';
    yield serializers.serialize(
      object.errors,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AppFacProblemDetailsAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  AppFacProblemDetailsAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($AppFacProblemDetailsAllOf)) as $AppFacProblemDetailsAllOf;
  }
}

/// a concrete implementation of [AppFacProblemDetailsAllOf], since [AppFacProblemDetailsAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $AppFacProblemDetailsAllOf implements AppFacProblemDetailsAllOf, Built<$AppFacProblemDetailsAllOf, $AppFacProblemDetailsAllOfBuilder> {
  $AppFacProblemDetailsAllOf._();

  factory $AppFacProblemDetailsAllOf([void Function($AppFacProblemDetailsAllOfBuilder)? updates]) = _$$AppFacProblemDetailsAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($AppFacProblemDetailsAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$AppFacProblemDetailsAllOf> get serializer => _$$AppFacProblemDetailsAllOfSerializer();
}

class _$$AppFacProblemDetailsAllOfSerializer implements PrimitiveSerializer<$AppFacProblemDetailsAllOf> {
  @override
  final Iterable<Type> types = const [$AppFacProblemDetailsAllOf, _$$AppFacProblemDetailsAllOf];

  @override
  final String wireName = r'$AppFacProblemDetailsAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $AppFacProblemDetailsAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(AppFacProblemDetailsAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppFacProblemDetailsAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'errors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.errors.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $AppFacProblemDetailsAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $AppFacProblemDetailsAllOfBuilder();
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

