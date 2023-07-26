// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_account_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAccountResponse extends InitAccountResponse {
  @override
  final AccountDto? account;

  factory _$InitAccountResponse(
          [void Function(InitAccountResponseBuilder)? updates]) =>
      (new InitAccountResponseBuilder()..update(updates))._build();

  _$InitAccountResponse._({this.account}) : super._();

  @override
  InitAccountResponse rebuild(
          void Function(InitAccountResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAccountResponseBuilder toBuilder() =>
      new InitAccountResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAccountResponse && account == other.account;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, account.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAccountResponse')
          ..add('account', account))
        .toString();
  }
}

class InitAccountResponseBuilder
    implements Builder<InitAccountResponse, InitAccountResponseBuilder> {
  _$InitAccountResponse? _$v;

  AccountDtoBuilder? _account;
  AccountDtoBuilder get account => _$this._account ??= new AccountDtoBuilder();
  set account(AccountDtoBuilder? account) => _$this._account = account;

  InitAccountResponseBuilder() {
    InitAccountResponse._defaults(this);
  }

  InitAccountResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _account = $v.account?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAccountResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAccountResponse;
  }

  @override
  void update(void Function(InitAccountResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAccountResponse build() => _build();

  _$InitAccountResponse _build() {
    _$InitAccountResponse _$result;
    try {
      _$result = _$v ?? new _$InitAccountResponse._(account: _account?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'account';
        _account?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAccountResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
