//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/notification_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'welcome_notification_dto.g.dart';

/// WelcomeNotificationDto
///
/// Properties:
/// * [id] 
/// * [header] 
/// * [message] 
/// * [readDateTime] 
/// * [discriminator] 
@BuiltValue()
abstract class WelcomeNotificationDto implements NotificationDto, Built<WelcomeNotificationDto, WelcomeNotificationDtoBuilder> {
  WelcomeNotificationDto._();

  factory WelcomeNotificationDto([void updates(WelcomeNotificationDtoBuilder b)]) = _$WelcomeNotificationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WelcomeNotificationDtoBuilder b) => b..discriminator=b.discriminatorValue;

  @BuiltValueSerializer(custom: true)
  static Serializer<WelcomeNotificationDto> get serializer => _$WelcomeNotificationDtoSerializer();
}

class _$WelcomeNotificationDtoSerializer implements PrimitiveSerializer<WelcomeNotificationDto> {
  @override
  final Iterable<Type> types = const [WelcomeNotificationDto, _$WelcomeNotificationDto];

  @override
  final String wireName = r'WelcomeNotificationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WelcomeNotificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.header != null) {
      yield r'header';
      yield serializers.serialize(
        object.header,
        specifiedType: const FullType(String),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.readDateTime != null) {
      yield r'readDateTime';
      yield serializers.serialize(
        object.readDateTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    yield r'discriminator';
    yield serializers.serialize(
      object.discriminator,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    WelcomeNotificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WelcomeNotificationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'header':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.header = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'readDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.readDateTime = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'discriminator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.discriminator = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WelcomeNotificationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WelcomeNotificationDtoBuilder();
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

