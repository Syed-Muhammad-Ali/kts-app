//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_notification_request.g.dart';

/// SetNotificationRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class SetNotificationRequest implements Built<SetNotificationRequest, SetNotificationRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  SetNotificationRequest._();

  factory SetNotificationRequest([void updates(SetNotificationRequestBuilder b)]) = _$SetNotificationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetNotificationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetNotificationRequest> get serializer => _$SetNotificationRequestSerializer();
}

class _$SetNotificationRequestSerializer implements PrimitiveSerializer<SetNotificationRequest> {
  @override
  final Iterable<Type> types = const [SetNotificationRequest, _$SetNotificationRequest];

  @override
  final String wireName = r'SetNotificationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetNotificationRequest object, {
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
    SetNotificationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetNotificationRequestBuilder result,
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
  SetNotificationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetNotificationRequestBuilder();
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

