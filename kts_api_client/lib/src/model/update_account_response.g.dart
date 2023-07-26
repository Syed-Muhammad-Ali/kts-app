// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAccountResponse extends UpdateAccountResponse {
  @override
  final int id;

  factory _$UpdateAccountResponse(
          [void Function(UpdateAccountResponseBuilder)? updates]) =>
      (new UpdateAccountResponseBuilder()..update(updates))._build();

  _$UpdateAccountResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateAccountResponse', 'id');
  }

  @override
  UpdateAccountResponse rebuild(
          void Function(UpdateAccountResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAccountResponseBuilder toBuilder() =>
      new UpdateAccountResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAccountResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'UpdateAccountResponse')
          ..add('id', id))
        .toString();
  }
}

class UpdateAccountResponseBuilder
    implements Builder<UpdateAccountResponse, UpdateAccountResponseBuilder> {
  _$UpdateAccountResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UpdateAccountResponseBuilder() {
    UpdateAccountResponse._defaults(this);
  }

  UpdateAccountResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAccountResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAccountResponse;
  }

  @override
  void update(void Function(UpdateAccountResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAccountResponse build() => _build();

  _$UpdateAccountResponse _build() {
    final _$result = _$v ??
        new _$UpdateAccountResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateAccountResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
