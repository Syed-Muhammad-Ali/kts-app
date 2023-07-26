// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_account_expense_by_category_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAccountExpenseByCategoryResponse
    extends InitAccountExpenseByCategoryResponse {
  @override
  final AccoutingPeriodDto? period;
  @override
  final BuiltList<ExpenseByCategoryItem>? expenseByCategories;

  factory _$InitAccountExpenseByCategoryResponse(
          [void Function(InitAccountExpenseByCategoryResponseBuilder)?
              updates]) =>
      (new InitAccountExpenseByCategoryResponseBuilder()..update(updates))
          ._build();

  _$InitAccountExpenseByCategoryResponse._(
      {this.period, this.expenseByCategories})
      : super._();

  @override
  InitAccountExpenseByCategoryResponse rebuild(
          void Function(InitAccountExpenseByCategoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAccountExpenseByCategoryResponseBuilder toBuilder() =>
      new InitAccountExpenseByCategoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAccountExpenseByCategoryResponse &&
        period == other.period &&
        expenseByCategories == other.expenseByCategories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, period.hashCode);
    _$hash = $jc(_$hash, expenseByCategories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAccountExpenseByCategoryResponse')
          ..add('period', period)
          ..add('expenseByCategories', expenseByCategories))
        .toString();
  }
}

class InitAccountExpenseByCategoryResponseBuilder
    implements
        Builder<InitAccountExpenseByCategoryResponse,
            InitAccountExpenseByCategoryResponseBuilder> {
  _$InitAccountExpenseByCategoryResponse? _$v;

  AccoutingPeriodDtoBuilder? _period;
  AccoutingPeriodDtoBuilder get period =>
      _$this._period ??= new AccoutingPeriodDtoBuilder();
  set period(AccoutingPeriodDtoBuilder? period) => _$this._period = period;

  ListBuilder<ExpenseByCategoryItem>? _expenseByCategories;
  ListBuilder<ExpenseByCategoryItem> get expenseByCategories =>
      _$this._expenseByCategories ??= new ListBuilder<ExpenseByCategoryItem>();
  set expenseByCategories(
          ListBuilder<ExpenseByCategoryItem>? expenseByCategories) =>
      _$this._expenseByCategories = expenseByCategories;

  InitAccountExpenseByCategoryResponseBuilder() {
    InitAccountExpenseByCategoryResponse._defaults(this);
  }

  InitAccountExpenseByCategoryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _period = $v.period?.toBuilder();
      _expenseByCategories = $v.expenseByCategories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAccountExpenseByCategoryResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAccountExpenseByCategoryResponse;
  }

  @override
  void update(
      void Function(InitAccountExpenseByCategoryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAccountExpenseByCategoryResponse build() => _build();

  _$InitAccountExpenseByCategoryResponse _build() {
    _$InitAccountExpenseByCategoryResponse _$result;
    try {
      _$result = _$v ??
          new _$InitAccountExpenseByCategoryResponse._(
              period: _period?.build(),
              expenseByCategories: _expenseByCategories?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'period';
        _period?.build();
        _$failedField = 'expenseByCategories';
        _expenseByCategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAccountExpenseByCategoryResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
