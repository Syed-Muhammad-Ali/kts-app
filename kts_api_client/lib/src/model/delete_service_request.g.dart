// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_service_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteServiceRequest extends DeleteServiceRequest {
  @override
  final int id;

  factory _$DeleteServiceRequest(
          [void Function(DeleteServiceRequestBuilder)? updates]) =>
      (new DeleteServiceRequestBuilder()..update(updates))._build();

  _$DeleteServiceRequest._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeleteServiceRequest', 'id');
  }

  @override
  DeleteServiceRequest rebuild(
          void Function(DeleteServiceRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteServiceRequestBuilder toBuilder() =>
      new DeleteServiceRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteServiceRequest && id == other.id;
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
    return (newBuiltValueToStringHelper(r'DeleteServiceRequest')..add('id', id))
        .toString();
  }
}

class DeleteServiceRequestBuilder
    implements Builder<DeleteServiceRequest, DeleteServiceRequestBuilder> {
  _$DeleteServiceRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DeleteServiceRequestBuilder() {
    DeleteServiceRequest._defaults(this);
  }

  DeleteServiceRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteServiceRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteServiceRequest;
  }

  @override
  void update(void Function(DeleteServiceRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteServiceRequest build() => _build();

  _$DeleteServiceRequest _build() {
    final _$result = _$v ??
        new _$DeleteServiceRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DeleteServiceRequest', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
