// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_account_expense_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAccountExpenseResponse extends InitAccountExpenseResponse {
  @override
  final BuiltList<ExpenseCategoryDto>? expenseCategories;
  @override
  final ExpenseDto? expense;

  factory _$InitAccountExpenseResponse(
          [void Function(InitAccountExpenseResponseBuilder)? updates]) =>
      (new InitAccountExpenseResponseBuilder()..update(updates))._build();

  _$InitAccountExpenseResponse._({this.expenseCategories, this.expense})
      : super._();

  @override
  InitAccountExpenseResponse rebuild(
          void Function(InitAccountExpenseResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAccountExpenseResponseBuilder toBuilder() =>
      new InitAccountExpenseResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAccountExpenseResponse &&
        expenseCategories == other.expenseCategories &&
        expense == other.expense;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenseCategories.hashCode);
    _$hash = $jc(_$hash, expense.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAccountExpenseResponse')
          ..add('expenseCategories', expenseCategories)
          ..add('expense', expense))
        .toString();
  }
}

class InitAccountExpenseResponseBuilder
    implements
        Builder<InitAccountExpenseResponse, InitAccountExpenseResponseBuilder> {
  _$InitAccountExpenseResponse? _$v;

  ListBuilder<ExpenseCategoryDto>? _expenseCategories;
  ListBuilder<ExpenseCategoryDto> get expenseCategories =>
      _$this._expenseCategories ??= new ListBuilder<ExpenseCategoryDto>();
  set expenseCategories(ListBuilder<ExpenseCategoryDto>? expenseCategories) =>
      _$this._expenseCategories = expenseCategories;

  ExpenseDtoBuilder? _expense;
  ExpenseDtoBuilder get expense => _$this._expense ??= new ExpenseDtoBuilder();
  set expense(ExpenseDtoBuilder? expense) => _$this._expense = expense;

  InitAccountExpenseResponseBuilder() {
    InitAccountExpenseResponse._defaults(this);
  }

  InitAccountExpenseResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenseCategories = $v.expenseCategories?.toBuilder();
      _expense = $v.expense?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAccountExpenseResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAccountExpenseResponse;
  }

  @override
  void update(void Function(InitAccountExpenseResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAccountExpenseResponse build() => _build();

  _$InitAccountExpenseResponse _build() {
    _$InitAccountExpenseResponse _$result;
    try {
      _$result = _$v ??
          new _$InitAccountExpenseResponse._(
              expenseCategories: _expenseCategories?.build(),
              expense: _expense?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenseCategories';
        _expenseCategories?.build();
        _$failedField = 'expense';
        _expense?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAccountExpenseResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
