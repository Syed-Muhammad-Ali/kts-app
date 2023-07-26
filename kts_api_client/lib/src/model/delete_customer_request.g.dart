// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_customer_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteCustomerRequest extends DeleteCustomerRequest {
  @override
  final int id;

  factory _$DeleteCustomerRequest(
          [void Function(DeleteCustomerRequestBuilder)? updates]) =>
      (new DeleteCustomerRequestBuilder()..update(updates))._build();

  _$DeleteCustomerRequest._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeleteCustomerRequest', 'id');
  }

  @override
  DeleteCustomerRequest rebuild(
          void Function(DeleteCustomerRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteCustomerRequestBuilder toBuilder() =>
      new DeleteCustomerRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteCustomerRequest && id == other.id;
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
    return (newBuiltValueToStringHelper(r'DeleteCustomerRequest')
          ..add('id', id))
        .toString();
  }
}

class DeleteCustomerRequestBuilder
    implements Builder<DeleteCustomerRequest, DeleteCustomerRequestBuilder> {
  _$DeleteCustomerRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DeleteCustomerRequestBuilder() {
    DeleteCustomerRequest._defaults(this);
  }

  DeleteCustomerRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteCustomerRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteCustomerRequest;
  }

  @override
  void update(void Function(DeleteCustomerRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteCustomerRequest build() => _build();

  _$DeleteCustomerRequest _build() {
    final _$result = _$v ??
        new _$DeleteCustomerRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DeleteCustomerRequest', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
