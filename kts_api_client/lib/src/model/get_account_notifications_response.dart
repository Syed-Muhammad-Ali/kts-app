//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/notification_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_account_notifications_response.g.dart';

/// GetAccountNotificationsResponse
///
/// Properties:
/// * [notifications] 
@BuiltValue()
abstract class GetAccountNotificationsResponse implements Built<GetAccountNotificationsResponse, GetAccountNotificationsResponseBuilder> {
  @BuiltValueField(wireName: r'notifications')
  BuiltList<NotificationDto>? get notifications;

  GetAccountNotificationsResponse._();

  factory GetAccountNotificationsResponse([void updates(GetAccountNotificationsResponseBuilder b)]) = _$GetAccountNotificationsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetAccountNotificationsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetAccountNotificationsResponse> get serializer => _$GetAccountNotificationsResponseSerializer();
}

class _$GetAccountNotificationsResponseSerializer implements PrimitiveSerializer<GetAccountNotificationsResponse> {
  @override
  final Iterable<Type> types = const [GetAccountNotificationsResponse, _$GetAccountNotificationsResponse];

  @override
  final String wireName = r'GetAccountNotificationsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetAccountNotificationsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.notifications != null) {
      yield r'notifications';
      yield serializers.serialize(
        object.notifications,
        specifiedType: const FullType(BuiltList, [FullType(NotificationDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetAccountNotificationsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetAccountNotificationsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'notifications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(NotificationDto)]),
          ) as BuiltList<NotificationDto>;
          result.notifications.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetAccountNotificationsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetAccountNotificationsResponseBuilder();
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

