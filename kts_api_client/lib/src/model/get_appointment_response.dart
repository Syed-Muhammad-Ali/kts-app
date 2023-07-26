//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/appointment_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_appointment_response.g.dart';

/// GetAppointmentResponse
///
/// Properties:
/// * [appointments] 
@BuiltValue()
abstract class GetAppointmentResponse implements Built<GetAppointmentResponse, GetAppointmentResponseBuilder> {
  @BuiltValueField(wireName: r'appointments')
  BuiltList<AppointmentDto>? get appointments;

  GetAppointmentResponse._();

  factory GetAppointmentResponse([void updates(GetAppointmentResponseBuilder b)]) = _$GetAppointmentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetAppointmentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetAppointmentResponse> get serializer => _$GetAppointmentResponseSerializer();
}

class _$GetAppointmentResponseSerializer implements PrimitiveSerializer<GetAppointmentResponse> {
  @override
  final Iterable<Type> types = const [GetAppointmentResponse, _$GetAppointmentResponse];

  @override
  final String wireName = r'GetAppointmentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetAppointmentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.appointments != null) {
      yield r'appointments';
      yield serializers.serialize(
        object.appointments,
        specifiedType: const FullType(BuiltList, [FullType(AppointmentDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetAppointmentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetAppointmentResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'appointments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AppointmentDto)]),
          ) as BuiltList<AppointmentDto>;
          result.appointments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetAppointmentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetAppointmentResponseBuilder();
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

