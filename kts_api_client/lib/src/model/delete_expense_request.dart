//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_expense_request.g.dart';

/// DeleteExpenseRequest
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class DeleteExpenseRequest implements Built<DeleteExpenseRequest, DeleteExpenseRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  DeleteExpenseRequest._();

  factory DeleteExpenseRequest([void updates(DeleteExpenseRequestBuilder b)]) = _$DeleteExpenseRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteExpenseRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteExpenseRequest> get serializer => _$DeleteExpenseRequestSerializer();
}

class _$DeleteExpenseRequestSerializer implements PrimitiveSerializer<DeleteExpenseRequest> {
  @override
  final Iterable<Type> types = const [DeleteExpenseRequest, _$DeleteExpenseRequest];

  @override
  final String wireName = r'DeleteExpenseRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteExpenseRequest object, {
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
    DeleteExpenseRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteExpenseRequestBuilder result,
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
  DeleteExpenseRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteExpenseRequestBuilder();
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

