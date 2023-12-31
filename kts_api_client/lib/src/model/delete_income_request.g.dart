// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_income_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteIncomeRequest extends DeleteIncomeRequest {
  @override
  final int id;

  factory _$DeleteIncomeRequest(
          [void Function(DeleteIncomeRequestBuilder)? updates]) =>
      (new DeleteIncomeRequestBuilder()..update(updates))._build();

  _$DeleteIncomeRequest._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeleteIncomeRequest', 'id');
  }

  @override
  DeleteIncomeRequest rebuild(
          void Function(DeleteIncomeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteIncomeRequestBuilder toBuilder() =>
      new DeleteIncomeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteIncomeRequest && id == other.id;
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
    return (newBuiltValueToStringHelper(r'DeleteIncomeRequest')..add('id', id))
        .toString();
  }
}

class DeleteIncomeRequestBuilder
    implements Builder<DeleteIncomeRequest, DeleteIncomeRequestBuilder> {
  _$DeleteIncomeRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DeleteIncomeRequestBuilder() {
    DeleteIncomeRequest._defaults(this);
  }

  DeleteIncomeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteIncomeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteIncomeRequest;
  }

  @override
  void update(void Function(DeleteIncomeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteIncomeRequest build() => _build();

  _$DeleteIncomeRequest _build() {
    final _$result = _$v ??
        new _$DeleteIncomeRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DeleteIncomeRequest', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
