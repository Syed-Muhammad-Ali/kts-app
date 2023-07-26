//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_customer_request.g.dart';

/// DeleteCustomerRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class DeleteCustomerRequest implements Built<DeleteCustomerRequest, DeleteCustomerRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  DeleteCustomerRequest._();

  factory DeleteCustomerRequest([void updates(DeleteCustomerRequestBuilder b)]) = _$DeleteCustomerRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteCustomerRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteCustomerRequest> get serializer => _$DeleteCustomerRequestSerializer();
}

class _$DeleteCustomerRequestSerializer implements PrimitiveSerializer<DeleteCustomerRequest> {
  @override
  final Iterable<Type> types = const [DeleteCustomerRequest, _$DeleteCustomerRequest];

  @override
  final String wireName = r'DeleteCustomerRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteCustomerRequest object, {
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
    DeleteCustomerRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteCustomerRequestBuilder result,
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
  DeleteCustomerRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteCustomerRequestBuilder();
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

