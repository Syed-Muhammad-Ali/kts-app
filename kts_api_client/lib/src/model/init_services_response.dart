//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:kts_booking_api/src/model/service_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_services_response.g.dart';

/// InitServicesResponse
///
/// Properties:
/// * [services] 
@BuiltValue()
abstract class InitServicesResponse implements Built<InitServicesResponse, InitServicesResponseBuilder> {
  @BuiltValueField(wireName: r'services')
  BuiltList<ServiceDto>? get services;

  InitServicesResponse._();

  factory InitServicesResponse([void updates(InitServicesResponseBuilder b)]) = _$InitServicesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitServicesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitServicesResponse> get serializer => _$InitServicesResponseSerializer();
}

class _$InitServicesResponseSerializer implements PrimitiveSerializer<InitServicesResponse> {
  @override
  final Iterable<Type> types = const [InitServicesResponse, _$InitServicesResponse];

  @override
  final String wireName = r'InitServicesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitServicesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.services != null) {
      yield r'services';
      yield serializers.serialize(
        object.services,
        specifiedType: const FullType(BuiltList, [FullType(ServiceDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitServicesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitServicesResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'services':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ServiceDto)]),
          ) as BuiltList<ServiceDto>;
          result.services.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitServicesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitServicesResponseBuilder();
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

