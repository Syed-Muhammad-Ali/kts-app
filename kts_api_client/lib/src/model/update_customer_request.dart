//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_customer_request.g.dart';

/// UpdateCustomerRequest
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [mobileNumber] 
/// * [email] 
@BuiltValue()
abstract class UpdateCustomerRequest implements Built<UpdateCustomerRequest, UpdateCustomerRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'mobileNumber')
  String? get mobileNumber;

  @BuiltValueField(wireName: r'email')
  String? get email;

  UpdateCustomerRequest._();

  factory UpdateCustomerRequest([void updates(UpdateCustomerRequestBuilder b)]) = _$UpdateCustomerRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCustomerRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCustomerRequest> get serializer => _$UpdateCustomerRequestSerializer();
}

class _$UpdateCustomerRequestSerializer implements PrimitiveSerializer<UpdateCustomerRequest> {
  @override
  final Iterable<Type> types = const [UpdateCustomerRequest, _$UpdateCustomerRequest];

  @override
  final String wireName = r'UpdateCustomerRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCustomerRequest object, {
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
    if (object.mobileNumber != null) {
      yield r'mobileNumber';
      yield serializers.serialize(
        object.mobileNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateCustomerRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateCustomerRequestBuilder result,
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
        case r'mobileNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mobileNumber = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateCustomerRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCustomerRequestBuilder();
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

