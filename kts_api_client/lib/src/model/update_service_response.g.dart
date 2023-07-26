// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_service_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateServiceResponse extends UpdateServiceResponse {
  @override
  final int id;

  factory _$UpdateServiceResponse(
          [void Function(UpdateServiceResponseBuilder)? updates]) =>
      (new UpdateServiceResponseBuilder()..update(updates))._build();

  _$UpdateServiceResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateServiceResponse', 'id');
  }

  @override
  UpdateServiceResponse rebuild(
          void Function(UpdateServiceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateServiceResponseBuilder toBuilder() =>
      new UpdateServiceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateServiceResponse && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateServiceResponse')
          ..add('id', id))
        .toString();
  }
}

class UpdateServiceResponseBuilder
    implements Builder<UpdateServiceResponse, UpdateServiceResponseBuilder> {
  _$UpdateServiceResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UpdateServiceResponseBuilder() {
    UpdateServiceResponse._defaults(this);
  }

  UpdateServiceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateServiceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateServiceResponse;
  }

  @override
  void update(void Function(UpdateServiceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateServiceResponse build() => _build();

  _$UpdateServiceResponse _build() {
    final _$result = _$v ??
        new _$UpdateServiceResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateServiceResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
