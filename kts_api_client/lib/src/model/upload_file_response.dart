//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_file_response.g.dart';

/// UploadFileResponse
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class UploadFileResponse implements Built<UploadFileResponse, UploadFileResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  UploadFileResponse._();

  factory UploadFileResponse([void updates(UploadFileResponseBuilder b)]) = _$UploadFileResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadFileResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadFileResponse> get serializer => _$UploadFileResponseSerializer();
}

class _$UploadFileResponseSerializer implements PrimitiveSerializer<UploadFileResponse> {
  @override
  final Iterable<Type> types = const [UploadFileResponse, _$UploadFileResponse];

  @override
  final String wireName = r'UploadFileResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadFileResponse object, {
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
    UploadFileResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadFileResponseBuilder result,
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
  UploadFileResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadFileResponseBuilder();
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

