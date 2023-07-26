//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_income_request.g.dart';

/// DeleteIncomeRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class DeleteIncomeRequest implements Built<DeleteIncomeRequest, DeleteIncomeRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  DeleteIncomeRequest._();

  factory DeleteIncomeRequest([void updates(DeleteIncomeRequestBuilder b)]) = _$DeleteIncomeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteIncomeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteIncomeRequest> get serializer => _$DeleteIncomeRequestSerializer();
}

class _$DeleteIncomeRequestSerializer implements PrimitiveSerializer<DeleteIncomeRequest> {
  @override
  final Iterable<Type> types = const [DeleteIncomeRequest, _$DeleteIncomeRequest];

  @override
  final String wireName = r'DeleteIncomeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteIncomeRequest object, {
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
    DeleteIncomeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteIncomeRequestBuilder result,
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
  DeleteIncomeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteIncomeRequestBuilder();
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

