// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_account_income_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAccountIncomeResponse extends InitAccountIncomeResponse {
  @override
  final AccoutingPeriodDto? accountingPeriod;
  @override
  final IncomeDto? income;

  factory _$InitAccountIncomeResponse(
          [void Function(InitAccountIncomeResponseBuilder)? updates]) =>
      (new InitAccountIncomeResponseBuilder()..update(updates))._build();

  _$InitAccountIncomeResponse._({this.accountingPeriod, this.income})
      : super._();

  @override
  InitAccountIncomeResponse rebuild(
          void Function(InitAccountIncomeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAccountIncomeResponseBuilder toBuilder() =>
      new InitAccountIncomeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAccountIncomeResponse &&
        accountingPeriod == other.accountingPeriod &&
        income == other.income;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountingPeriod.hashCode);
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAccountIncomeResponse')
          ..add('accountingPeriod', accountingPeriod)
          ..add('income', income))
        .toString();
  }
}

class InitAccountIncomeResponseBuilder
    implements
        Builder<InitAccountIncomeResponse, InitAccountIncomeResponseBuilder> {
  _$InitAccountIncomeResponse? _$v;

  AccoutingPeriodDtoBuilder? _accountingPeriod;
  AccoutingPeriodDtoBuilder get accountingPeriod =>
      _$this._accountingPeriod ??= new AccoutingPeriodDtoBuilder();
  set accountingPeriod(AccoutingPeriodDtoBuilder? accountingPeriod) =>
      _$this._accountingPeriod = accountingPeriod;

  IncomeDtoBuilder? _income;
  IncomeDtoBuilder get income => _$this._income ??= new IncomeDtoBuilder();
  set income(IncomeDtoBuilder? income) => _$this._income = income;

  InitAccountIncomeResponseBuilder() {
    InitAccountIncomeResponse._defaults(this);
  }

  InitAccountIncomeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountingPeriod = $v.accountingPeriod?.toBuilder();
      _income = $v.income?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAccountIncomeResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAccountIncomeResponse;
  }

  @override
  void update(void Function(InitAccountIncomeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAccountIncomeResponse build() => _build();

  _$InitAccountIncomeResponse _build() {
    _$InitAccountIncomeResponse _$result;
    try {
      _$result = _$v ??
          new _$InitAccountIncomeResponse._(
              accountingPeriod: _accountingPeriod?.build(),
              income: _income?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accountingPeriod';
        _accountingPeriod?.build();
        _$failedField = 'income';
        _income?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAccountIncomeResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
