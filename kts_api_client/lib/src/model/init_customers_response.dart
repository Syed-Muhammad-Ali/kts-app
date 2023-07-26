//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/customer_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_customers_response.g.dart';

/// InitCustomersResponse
///
/// Properties:
/// * [customers] 
@BuiltValue()
abstract class InitCustomersResponse implements Built<InitCustomersResponse, InitCustomersResponseBuilder> {
  @BuiltValueField(wireName: r'customers')
  BuiltList<CustomerDto>? get customers;

  InitCustomersResponse._();

  factory InitCustomersResponse([void updates(InitCustomersResponseBuilder b)]) = _$InitCustomersResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitCustomersResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitCustomersResponse> get serializer => _$InitCustomersResponseSerializer();
}

class _$InitCustomersResponseSerializer implements PrimitiveSerializer<InitCustomersResponse> {
  @override
  final Iterable<Type> types = const [InitCustomersResponse, _$InitCustomersResponse];

  @override
  final String wireName = r'InitCustomersResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitCustomersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.customers != null) {
      yield r'customers';
      yield serializers.serialize(
        object.customers,
        specifiedType: const FullType(BuiltList, [FullType(CustomerDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitCustomersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitCustomersResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'customers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CustomerDto)]),
          ) as BuiltList<CustomerDto>;
          result.customers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitCustomersResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitCustomersResponseBuilder();
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

