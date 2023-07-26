//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_service_response.g.dart';

/// UpdateServiceResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UpdateServiceResponse implements Built<UpdateServiceResponse, UpdateServiceResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UpdateServiceResponse._();

  factory UpdateServiceResponse([void updates(UpdateServiceResponseBuilder b)]) = _$UpdateServiceResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateServiceResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateServiceResponse> get serializer => _$UpdateServiceResponseSerializer();
}

class _$UpdateServiceResponseSerializer implements PrimitiveSerializer<UpdateServiceResponse> {
  @override
  final Iterable<Type> types = const [UpdateServiceResponse, _$UpdateServiceResponse];

  @override
  final String wireName = r'UpdateServiceResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateServiceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateServiceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateServiceResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateServiceResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateServiceResponseBuilder();
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

