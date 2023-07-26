//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_service_request.g.dart';

/// DeleteServiceRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class DeleteServiceRequest implements Built<DeleteServiceRequest, DeleteServiceRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  DeleteServiceRequest._();

  factory DeleteServiceRequest([void updates(DeleteServiceRequestBuilder b)]) = _$DeleteServiceRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteServiceRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteServiceRequest> get serializer => _$DeleteServiceRequestSerializer();
}

class _$DeleteServiceRequestSerializer implements PrimitiveSerializer<DeleteServiceRequest> {
  @override
  final Iterable<Type> types = const [DeleteServiceRequest, _$DeleteServiceRequest];

  @override
  final String wireName = r'DeleteServiceRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteServiceRequest object, {
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
    DeleteServiceRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteServiceRequestBuilder result,
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
  DeleteServiceRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteServiceRequestBuilder();
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

