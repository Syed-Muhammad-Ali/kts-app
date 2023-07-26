//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/welcome_notification_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_dto.g.dart';

/// NotificationDto
///
/// Properties:
/// * [id] 
/// * [header] 
/// * [message] 
/// * [readDateTime] 
/// * [discriminator] 
@BuiltValue(instantiable: false)
abstract class NotificationDto  {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'header')
  String? get header;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'readDateTime')
  DateTime? get readDateTime;

  @BuiltValueField(wireName: r'discriminator')
  String get discriminator;

  static const String discriminatorFieldName = r'discriminator';

  static const Map<String, Type> discriminatorMapping = {
    r'WelcomeNotificationDto': WelcomeNotificationDto,
  };

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationDto> get serializer => _$NotificationDtoSerializer();
}

extension NotificationDtoDiscriminatorExt on NotificationDto {
    String? get discriminatorValue {
        if (this is WelcomeNotificationDto) {
            return r'WelcomeNotificationDto';
        }
        return null;
    }
}
extension NotificationDtoBuilderDiscriminatorExt on NotificationDtoBuilder {
    String? get discriminatorValue {
        if (this is WelcomeNotificationDtoBuilder) {
            return r'WelcomeNotificationDto';
        }
        return null;
    }
}

class _$NotificationDtoSerializer implements PrimitiveSerializer<NotificationDto> {
  @override
  final Iterable<Type> types = const [NotificationDto];

  @override
  final String wireName = r'NotificationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.header != null) {
      yield r'header';
      yield serializers.serialize(
        object.header,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.readDateTime != null) {
      yield r'readDateTime';
      yield serializers.serialize(
        object.readDateTime,
        specifiedType: const FullType(DateTime),
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
    NotificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (object is WelcomeNotificationDto) {
      return serializers.serialize(object, specifiedType: FullType(WelcomeNotificationDto))!;
    }
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  NotificationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex = serializedList.indexOf(NotificationDto.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex], specifiedType: FullType(String)) as String;
    switch (discValue) {
      case r'WelcomeNotificationDto':
        return serializers.deserialize(serialized, specifiedType: FullType(WelcomeNotificationDto)) as WelcomeNotificationDto;
      default:
        return serializers.deserialize(serialized, specifiedType: FullType($NotificationDto)) as $NotificationDto;
    }
  }
}

/// a concrete implementation of [NotificationDto], since [NotificationDto] is not instantiable
@BuiltValue(instantiable: true)
abstract class $NotificationDto implements NotificationDto, Built<$NotificationDto, $NotificationDtoBuilder> {
  $NotificationDto._();

  factory $NotificationDto([void Function($NotificationDtoBuilder)? updates]) = _$$NotificationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($NotificationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$NotificationDto> get serializer => _$$NotificationDtoSerializer();
}

class _$$NotificationDtoSerializer implements PrimitiveSerializer<$NotificationDto> {
  @override
  final Iterable<Type> types = const [$NotificationDto, _$$NotificationDto];

  @override
  final String wireName = r'$NotificationDto';

  @override
  Object serialize(
    Serializers serializers,
    $NotificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(NotificationDto))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NotificationDtoBuilder result,
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
        case r'header':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.header = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'readDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.readDateTime = valueDes;
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
  $NotificationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $NotificationDtoBuilder();
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

