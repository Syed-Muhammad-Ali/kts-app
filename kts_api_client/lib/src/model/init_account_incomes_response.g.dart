// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_account_incomes_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAccountIncomesResponse extends InitAccountIncomesResponse {
  @override
  final AccoutingPeriodDto? accountingPeriod;
  @override
  final BuiltList<IncomeDto>? income;
  @override
  final num totalIncomeSum;

  factory _$InitAccountIncomesResponse(
          [void Function(InitAccountIncomesResponseBuilder)? updates]) =>
      (new InitAccountIncomesResponseBuilder()..update(updates))._build();

  _$InitAccountIncomesResponse._(
      {this.accountingPeriod, this.income, required this.totalIncomeSum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalIncomeSum, r'InitAccountIncomesResponse', 'totalIncomeSum');
  }

  @override
  InitAccountIncomesResponse rebuild(
          void Function(InitAccountIncomesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAccountIncomesResponseBuilder toBuilder() =>
      new InitAccountIncomesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAccountIncomesResponse &&
        accountingPeriod == other.accountingPeriod &&
        income == other.income &&
        totalIncomeSum == other.totalIncomeSum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountingPeriod.hashCode);
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jc(_$hash, totalIncomeSum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAccountIncomesResponse')
          ..add('accountingPeriod', accountingPeriod)
          ..add('income', income)
          ..add('totalIncomeSum', totalIncomeSum))
        .toString();
  }
}

class InitAccountIncomesResponseBuilder
    implements
        Builder<InitAccountIncomesResponse, InitAccountIncomesResponseBuilder> {
  _$InitAccountIncomesResponse? _$v;

  AccoutingPeriodDtoBuilder? _accountingPeriod;
  AccoutingPeriodDtoBuilder get accountingPeriod =>
      _$this._accountingPeriod ??= new AccoutingPeriodDtoBuilder();
  set accountingPeriod(AccoutingPeriodDtoBuilder? accountingPeriod) =>
      _$this._accountingPeriod = accountingPeriod;

  ListBuilder<IncomeDto>? _income;
  ListBuilder<IncomeDto> get income =>
      _$this._income ??= new ListBuilder<IncomeDto>();
  set income(ListBuilder<IncomeDto>? income) => _$this._income = income;

  num? _totalIncomeSum;
  num? get totalIncomeSum => _$this._totalIncomeSum;
  set totalIncomeSum(num? totalIncomeSum) =>
      _$this._totalIncomeSum = totalIncomeSum;

  InitAccountIncomesResponseBuilder() {
    InitAccountIncomesResponse._defaults(this);
  }

  InitAccountIncomesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountingPeriod = $v.accountingPeriod?.toBuilder();
      _income = $v.income?.toBuilder();
      _totalIncomeSum = $v.totalIncomeSum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAccountIncomesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAccountIncomesResponse;
  }

  @override
  void update(void Function(InitAccountIncomesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAccountIncomesResponse build() => _build();

  _$InitAccountIncomesResponse _build() {
    _$InitAccountIncomesResponse _$result;
    try {
      _$result = _$v ??
          new _$InitAccountIncomesResponse._(
              accountingPeriod: _accountingPeriod?.build(),
              income: _income?.build(),
              totalIncomeSum: BuiltValueNullFieldError.checkNotNull(
                  totalIncomeSum,
                  r'InitAccountIncomesResponse',
                  'totalIncomeSum'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accountingPeriod';
        _accountingPeriod?.build();
        _$failedField = 'income';
        _income?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAccountIncomesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
