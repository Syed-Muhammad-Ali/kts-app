// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounting_period_overview_stats.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountingPeriodOverviewStats extends AccountingPeriodOverviewStats {
  @override
  final num revenue;
  @override
  final num expenses;
  @override
  final num profit;
  @override
  final num taxLiability;
  @override
  final num nic;

  factory _$AccountingPeriodOverviewStats(
          [void Function(AccountingPeriodOverviewStatsBuilder)? updates]) =>
      (new AccountingPeriodOverviewStatsBuilder()..update(updates))._build();

  _$AccountingPeriodOverviewStats._(
      {required this.revenue,
      required this.expenses,
      required this.profit,
      required this.taxLiability,
      required this.nic})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        revenue, r'AccountingPeriodOverviewStats', 'revenue');
    BuiltValueNullFieldError.checkNotNull(
        expenses, r'AccountingPeriodOverviewStats', 'expenses');
    BuiltValueNullFieldError.checkNotNull(
        profit, r'AccountingPeriodOverviewStats', 'profit');
    BuiltValueNullFieldError.checkNotNull(
        taxLiability, r'AccountingPeriodOverviewStats', 'taxLiability');
    BuiltValueNullFieldError.checkNotNull(
        nic, r'AccountingPeriodOverviewStats', 'nic');
  }

  @override
  AccountingPeriodOverviewStats rebuild(
          void Function(AccountingPeriodOverviewStatsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountingPeriodOverviewStatsBuilder toBuilder() =>
      new AccountingPeriodOverviewStatsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountingPeriodOverviewStats &&
        revenue == other.revenue &&
        expenses == other.expenses &&
        profit == other.profit &&
        taxLiability == other.taxLiability &&
        nic == other.nic;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, revenue.hashCode);
    _$hash = $jc(_$hash, expenses.hashCode);
    _$hash = $jc(_$hash, profit.hashCode);
    _$hash = $jc(_$hash, taxLiability.hashCode);
    _$hash = $jc(_$hash, nic.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountingPeriodOverviewStats')
          ..add('revenue', revenue)
          ..add('expenses', expenses)
          ..add('profit', profit)
          ..add('taxLiability', taxLiability)
          ..add('nic', nic))
        .toString();
  }
}

class AccountingPeriodOverviewStatsBuilder
    implements
        Builder<AccountingPeriodOverviewStats,
            AccountingPeriodOverviewStatsBuilder> {
  _$AccountingPeriodOverviewStats? _$v;

  num? _revenue;
  num? get revenue => _$this._revenue;
  set revenue(num? revenue) => _$this._revenue = revenue;

  num? _expenses;
  num? get expenses => _$this._expenses;
  set expenses(num? expenses) => _$this._expenses = expenses;

  num? _profit;
  num? get profit => _$this._profit;
  set profit(num? profit) => _$this._profit = profit;

  num? _taxLiability;
  num? get taxLiability => _$this._taxLiability;
  set taxLiability(num? taxLiability) => _$this._taxLiability = taxLiability;

  num? _nic;
  num? get nic => _$this._nic;
  set nic(num? nic) => _$this._nic = nic;

  AccountingPeriodOverviewStatsBuilder() {
    AccountingPeriodOverviewStats._defaults(this);
  }

  AccountingPeriodOverviewStatsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _revenue = $v.revenue;
      _expenses = $v.expenses;
      _profit = $v.profit;
      _taxLiability = $v.taxLiability;
      _nic = $v.nic;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountingPeriodOverviewStats other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountingPeriodOverviewStats;
  }

  @override
  void update(void Function(AccountingPeriodOverviewStatsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountingPeriodOverviewStats build() => _build();

  _$AccountingPeriodOverviewStats _build() {
    final _$result = _$v ??
        new _$AccountingPeriodOverviewStats._(
            revenue: BuiltValueNullFieldError.checkNotNull(
                revenue, r'AccountingPeriodOverviewStats', 'revenue'),
            expenses: BuiltValueNullFieldError.checkNotNull(
                expenses, r'AccountingPeriodOverviewStats', 'expenses'),
            profit: BuiltValueNullFieldError.checkNotNull(
                profit, r'AccountingPeriodOverviewStats', 'profit'),
            taxLiability: BuiltValueNullFieldError.checkNotNull(
                taxLiability, r'AccountingPeriodOverviewStats', 'taxLiability'),
            nic: BuiltValueNullFieldError.checkNotNull(
                nic, r'AccountingPeriodOverviewStats', 'nic'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
