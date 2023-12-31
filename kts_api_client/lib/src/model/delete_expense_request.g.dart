// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteExpenseRequest extends DeleteExpenseRequest {
  @override
  final int id;

  factory _$DeleteExpenseRequest(
          [void Function(DeleteExpenseRequestBuilder)? updates]) =>
      (new DeleteExpenseRequestBuilder()..update(updates))._build();

  _$DeleteExpenseRequest._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeleteExpenseRequest', 'id');
  }

  @override
  DeleteExpenseRequest rebuild(
          void Function(DeleteExpenseRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteExpenseRequestBuilder toBuilder() =>
      new DeleteExpenseRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteExpenseRequest && id == other.id;
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
    return (newBuiltValueToStringHelper(r'DeleteExpenseRequest')..add('id', id))
        .toString();
  }
}

class DeleteExpenseRequestBuilder
    implements Builder<DeleteExpenseRequest, DeleteExpenseRequestBuilder> {
  _$DeleteExpenseRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DeleteExpenseRequestBuilder() {
    DeleteExpenseRequest._defaults(this);
  }

  DeleteExpenseRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteExpenseRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteExpenseRequest;
  }

  @override
  void update(void Function(DeleteExpenseRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteExpenseRequest build() => _build();

  _$DeleteExpenseRequest _build() {
    final _$result = _$v ??
        new _$DeleteExpenseRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DeleteExpenseRequest', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
