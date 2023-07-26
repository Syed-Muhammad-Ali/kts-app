// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_account_expenses_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAccountExpensesResponse extends InitAccountExpensesResponse {
  @override
  final AccoutingPeriodDto? accountingPeriod;
  @override
  final num totalExpenseSum;
  @override
  final BuiltList<ExpenseDto>? expenses;
  @override
  final ExpenseCategoryDto? category;

  factory _$InitAccountExpensesResponse(
          [void Function(InitAccountExpensesResponseBuilder)? updates]) =>
      (new InitAccountExpensesResponseBuilder()..update(updates))._build();

  _$InitAccountExpensesResponse._(
      {this.accountingPeriod,
      required this.totalExpenseSum,
      this.expenses,
      this.category})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalExpenseSum, r'InitAccountExpensesResponse', 'totalExpenseSum');
  }

  @override
  InitAccountExpensesResponse rebuild(
          void Function(InitAccountExpensesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAccountExpensesResponseBuilder toBuilder() =>
      new InitAccountExpensesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAccountExpensesResponse &&
        accountingPeriod == other.accountingPeriod &&
        totalExpenseSum == other.totalExpenseSum &&
        expenses == other.expenses &&
        category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountingPeriod.hashCode);
    _$hash = $jc(_$hash, totalExpenseSum.hashCode);
    _$hash = $jc(_$hash, expenses.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAccountExpensesResponse')
          ..add('accountingPeriod', accountingPeriod)
          ..add('totalExpenseSum', totalExpenseSum)
          ..add('expenses', expenses)
          ..add('category', category))
        .toString();
  }
}

class InitAccountExpensesResponseBuilder
    implements
        Builder<InitAccountExpensesResponse,
            InitAccountExpensesResponseBuilder> {
  _$InitAccountExpensesResponse? _$v;

  AccoutingPeriodDtoBuilder? _accountingPeriod;
  AccoutingPeriodDtoBuilder get accountingPeriod =>
      _$this._accountingPeriod ??= new AccoutingPeriodDtoBuilder();
  set accountingPeriod(AccoutingPeriodDtoBuilder? accountingPeriod) =>
      _$this._accountingPeriod = accountingPeriod;

  num? _totalExpenseSum;
  num? get totalExpenseSum => _$this._totalExpenseSum;
  set totalExpenseSum(num? totalExpenseSum) =>
      _$this._totalExpenseSum = totalExpenseSum;

  ListBuilder<ExpenseDto>? _expenses;
  ListBuilder<ExpenseDto> get expenses =>
      _$this._expenses ??= new ListBuilder<ExpenseDto>();
  set expenses(ListBuilder<ExpenseDto>? expenses) =>
      _$this._expenses = expenses;

  ExpenseCategoryDtoBuilder? _category;
  ExpenseCategoryDtoBuilder get category =>
      _$this._category ??= new ExpenseCategoryDtoBuilder();
  set category(ExpenseCategoryDtoBuilder? category) =>
      _$this._category = category;

  InitAccountExpensesResponseBuilder() {
    InitAccountExpensesResponse._defaults(this);
  }

  InitAccountExpensesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountingPeriod = $v.accountingPeriod?.toBuilder();
      _totalExpenseSum = $v.totalExpenseSum;
      _expenses = $v.expenses?.toBuilder();
      _category = $v.category?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAccountExpensesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAccountExpensesResponse;
  }

  @override
  void update(void Function(InitAccountExpensesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAccountExpensesResponse build() => _build();

  _$InitAccountExpensesResponse _build() {
    _$InitAccountExpensesResponse _$result;
    try {
      _$result = _$v ??
          new _$InitAccountExpensesResponse._(
              accountingPeriod: _accountingPeriod?.build(),
              totalExpenseSum: BuiltValueNullFieldError.checkNotNull(
                  totalExpenseSum,
                  r'InitAccountExpensesResponse',
                  'totalExpenseSum'),
              expenses: _expenses?.build(),
              category: _category?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accountingPeriod';
        _accountingPeriod?.build();

        _$failedField = 'expenses';
        _expenses?.build();
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAccountExpensesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
