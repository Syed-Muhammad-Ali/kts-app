// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignupResponse extends SignupResponse {
  @override
  final int accountId;

  factory _$SignupResponse([void Function(SignupResponseBuilder)? updates]) =>
      (new SignupResponseBuilder()..update(updates))._build();

  _$SignupResponse._({required this.accountId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accountId, r'SignupResponse', 'accountId');
  }

  @override
  SignupResponse rebuild(void Function(SignupResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignupResponseBuilder toBuilder() =>
      new SignupResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignupResponse && accountId == other.accountId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignupResponse')
          ..add('accountId', accountId))
        .toString();
  }
}

class SignupResponseBuilder
    implements Builder<SignupResponse, SignupResponseBuilder> {
  _$SignupResponse? _$v;

  int? _accountId;
  int? get accountId => _$this._accountId;
  set accountId(int? accountId) => _$this._accountId = accountId;

  SignupResponseBuilder() {
    SignupResponse._defaults(this);
  }

  SignupResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountId = $v.accountId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignupResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignupResponse;
  }

  @override
  void update(void Function(SignupResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignupResponse build() => _build();

  _$SignupResponse _build() {
    final _$result = _$v ??
        new _$SignupResponse._(
            accountId: BuiltValueNullFieldError.checkNotNull(
                accountId, r'SignupResponse', 'accountId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
