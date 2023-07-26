// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounting_period_overview_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountingPeriodOverviewResponse
    extends AccountingPeriodOverviewResponse {
  @override
  final AccountingPeriodOverviewStats? current;
  @override
  final AccountingPeriodOverviewStats? forecasted;

  factory _$AccountingPeriodOverviewResponse(
          [void Function(AccountingPeriodOverviewResponseBuilder)? updates]) =>
      (new AccountingPeriodOverviewResponseBuilder()..update(updates))._build();

  _$AccountingPeriodOverviewResponse._({this.current, this.forecasted})
      : super._();

  @override
  AccountingPeriodOverviewResponse rebuild(
          void Function(AccountingPeriodOverviewResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountingPeriodOverviewResponseBuilder toBuilder() =>
      new AccountingPeriodOverviewResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountingPeriodOverviewResponse &&
        current == other.current &&
        forecasted == other.forecasted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, current.hashCode);
    _$hash = $jc(_$hash, forecasted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountingPeriodOverviewResponse')
          ..add('current', current)
          ..add('forecasted', forecasted))
        .toString();
  }
}

class AccountingPeriodOverviewResponseBuilder
    implements
        Builder<AccountingPeriodOverviewResponse,
            AccountingPeriodOverviewResponseBuilder> {
  _$AccountingPeriodOverviewResponse? _$v;

  AccountingPeriodOverviewStatsBuilder? _current;
  AccountingPeriodOverviewStatsBuilder get current =>
      _$this._current ??= new AccountingPeriodOverviewStatsBuilder();
  set current(AccountingPeriodOverviewStatsBuilder? current) =>
      _$this._current = current;

  AccountingPeriodOverviewStatsBuilder? _forecasted;
  AccountingPeriodOverviewStatsBuilder get forecasted =>
      _$this._forecasted ??= new AccountingPeriodOverviewStatsBuilder();
  set forecasted(AccountingPeriodOverviewStatsBuilder? forecasted) =>
      _$this._forecasted = forecasted;

  AccountingPeriodOverviewResponseBuilder() {
    AccountingPeriodOverviewResponse._defaults(this);
  }

  AccountingPeriodOverviewResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _current = $v.current?.toBuilder();
      _forecasted = $v.forecasted?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountingPeriodOverviewResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountingPeriodOverviewResponse;
  }

  @override
  void update(void Function(AccountingPeriodOverviewResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountingPeriodOverviewResponse build() => _build();

  _$AccountingPeriodOverviewResponse _build() {
    _$AccountingPeriodOverviewResponse _$result;
    try {
      _$result = _$v ??
          new _$AccountingPeriodOverviewResponse._(
              current: _current?.build(), forecasted: _forecasted?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'current';
        _current?.build();
        _$failedField = 'forecasted';
        _forecasted?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AccountingPeriodOverviewResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
