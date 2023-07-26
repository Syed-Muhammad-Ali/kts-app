// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAccountResponse extends GetAccountResponse {
  @override
  final AccountDto? account;

  factory _$GetAccountResponse(
          [void Function(GetAccountResponseBuilder)? updates]) =>
      (new GetAccountResponseBuilder()..update(updates))._build();

  _$GetAccountResponse._({this.account}) : super._();

  @override
  GetAccountResponse rebuild(
          void Function(GetAccountResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAccountResponseBuilder toBuilder() =>
      new GetAccountResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAccountResponse && account == other.account;
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
    return (newBuiltValueToStringHelper(r'GetAccountResponse')
          ..add('account', account))
        .toString();
  }
}

class GetAccountResponseBuilder
    implements Builder<GetAccountResponse, GetAccountResponseBuilder> {
  _$GetAccountResponse? _$v;

  AccountDtoBuilder? _account;
  AccountDtoBuilder get account => _$this._account ??= new AccountDtoBuilder();
  set account(AccountDtoBuilder? account) => _$this._account = account;

  GetAccountResponseBuilder() {
    GetAccountResponse._defaults(this);
  }

  GetAccountResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _account = $v.account?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAccountResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAccountResponse;
  }

  @override
  void update(void Function(GetAccountResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAccountResponse build() => _build();

  _$GetAccountResponse _build() {
    _$GetAccountResponse _$result;
    try {
      _$result = _$v ?? new _$GetAccountResponse._(account: _account?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'account';
        _account?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetAccountResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
