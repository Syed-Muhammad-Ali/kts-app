//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:kts_booking_api/src/model/deposit_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_service_request.g.dart';

/// UpdateServiceRequest
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [totalPrice] 
/// * [depositType] 
/// * [deposit] 
/// * [defaultAppointmentDuration] 
@BuiltValue()
abstract class UpdateServiceRequest implements Built<UpdateServiceRequest, UpdateServiceRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'totalPrice')
  num get totalPrice;

  @BuiltValueField(wireName: r'depositType')
  DepositType get depositType;
  // enum depositTypeEnum {  Percentage,  Fixed,  };

  @BuiltValueField(wireName: r'deposit')
  num get deposit;

  @BuiltValueField(wireName: r'defaultAppointmentDuration')
  int? get defaultAppointmentDuration;

  UpdateServiceRequest._();

  factory UpdateServiceRequest([void updates(UpdateServiceRequestBuilder b)]) = _$UpdateServiceRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateServiceRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateServiceRequest> get serializer => _$UpdateServiceRequestSerializer();
}

class _$UpdateServiceRequestSerializer implements PrimitiveSerializer<UpdateServiceRequest> {
  @override
  final Iterable<Type> types = const [UpdateServiceRequest, _$UpdateServiceRequest];

  @override
  final String wireName = r'UpdateServiceRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateServiceRequest object, {
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
    yield r'totalPrice';
    yield serializers.serialize(
      object.totalPrice,
      specifiedType: const FullType(num),
    );
    yield r'depositType';
    yield serializers.serialize(
      object.depositType,
      specifiedType: const FullType(DepositType),
    );
    yield r'deposit';
    yield serializers.serialize(
      object.deposit,
      specifiedType: const FullType(num),
    );
    if (object.defaultAppointmentDuration != null) {
      yield r'defaultAppointmentDuration';
      yield serializers.serialize(
        object.defaultAppointmentDuration,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateServiceRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateServiceRequestBuilder result,
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
        case r'totalPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalPrice = valueDes;
          break;
        case r'depositType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DepositType),
          ) as DepositType;
          result.depositType = valueDes;
          break;
        case r'deposit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.deposit = valueDes;
          break;
        case r'defaultAppointmentDuration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.defaultAppointmentDuration = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateServiceRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateServiceRequestBuilder();
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

