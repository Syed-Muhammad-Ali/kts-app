// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_exists_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountExistsResponse extends AccountExistsResponse {
  @override
  final bool exists;

  factory _$AccountExistsResponse(
          [void Function(AccountExistsResponseBuilder)? updates]) =>
      (new AccountExistsResponseBuilder()..update(updates))._build();

  _$AccountExistsResponse._({required this.exists}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        exists, r'AccountExistsResponse', 'exists');
  }

  @override
  AccountExistsResponse rebuild(
          void Function(AccountExistsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountExistsResponseBuilder toBuilder() =>
      new AccountExistsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountExistsResponse && exists == other.exists;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, exists.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountExistsResponse')
          ..add('exists', exists))
        .toString();
  }
}

class AccountExistsResponseBuilder
    implements Builder<AccountExistsResponse, AccountExistsResponseBuilder> {
  _$AccountExistsResponse? _$v;

  bool? _exists;
  bool? get exists => _$this._exists;
  set exists(bool? exists) => _$this._exists = exists;

  AccountExistsResponseBuilder() {
    AccountExistsResponse._defaults(this);
  }

  AccountExistsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _exists = $v.exists;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountExistsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountExistsResponse;
  }

  @override
  void update(void Function(AccountExistsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountExistsResponse build() => _build();

  _$AccountExistsResponse _build() {
    final _$result = _$v ??
        new _$AccountExistsResponse._(
            exists: BuiltValueNullFieldError.checkNotNull(
                exists, r'AccountExistsResponse', 'exists'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
