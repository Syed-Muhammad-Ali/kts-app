//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_customer_request.g.dart';

/// CreateCustomerRequest
///
/// Properties:
/// * [name] 
/// * [mobileNumber] 
/// * [email] 
@BuiltValue()
abstract class CreateCustomerRequest implements Built<CreateCustomerRequest, CreateCustomerRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'mobileNumber')
  String? get mobileNumber;

  @BuiltValueField(wireName: r'email')
  String? get email;

  CreateCustomerRequest._();

  factory CreateCustomerRequest([void updates(CreateCustomerRequestBuilder b)]) = _$CreateCustomerRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCustomerRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCustomerRequest> get serializer => _$CreateCustomerRequestSerializer();
}

class _$CreateCustomerRequestSerializer implements PrimitiveSerializer<CreateCustomerRequest> {
  @override
  final Iterable<Type> types = const [CreateCustomerRequest, _$CreateCustomerRequest];

  @override
  final String wireName = r'CreateCustomerRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCustomerRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    CreateCustomerRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCustomerRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CreateCustomerRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCustomerRequestBuilder();
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

