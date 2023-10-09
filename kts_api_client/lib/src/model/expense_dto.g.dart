// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseDto extends ExpenseDto {
  @override
  final num amount;
  @override
  final ExpenseCategoryDto? category;
  @override
  final int id;
  @override
  final String? notes;
  @override
  final PaymentMethod paymentMethod;
  @override
  final DateTime paidDateTime;
  @override
  final String? supplier;
  @override
  final String? recurring;
  @override
  final FileDto? receipt;

  factory _$ExpenseDto([void Function(ExpenseDtoBuilder)? updates]) =>
      (new ExpenseDtoBuilder()..update(updates))._build();

  _$ExpenseDto._(
      {required this.amount,
      this.category,
      required this.id,
      this.notes,
      required this.paymentMethod,
      required this.paidDateTime,
      this.supplier,
      this.recurring,
      this.receipt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, r'ExpenseDto', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'ExpenseDto', 'id');
    BuiltValueNullFieldError.checkNotNull(
        paymentMethod, r'ExpenseDto', 'paymentMethod');
    BuiltValueNullFieldError.checkNotNull(
        paidDateTime, r'ExpenseDto', 'paidDateTime');
  }

  @override
  ExpenseDto rebuild(void Function(ExpenseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseDtoBuilder toBuilder() => new ExpenseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseDto &&
        amount == other.amount &&
        category == other.category &&
        id == other.id &&
        notes == other.notes &&
        paymentMethod == other.paymentMethod &&
        paidDateTime == other.paidDateTime &&
        supplier == other.supplier &&
        receipt == other.receipt  &&
        recurring == other.recurring;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paidDateTime.hashCode);
    _$hash = $jc(_$hash, supplier.hashCode);
    _$hash = $jc(_$hash, recurring.hashCode);
    _$hash = $jc(_$hash, receipt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseDto')
          ..add('amount', amount)
          ..add('category', category)
          ..add('id', id)
          ..add('notes', notes)
          ..add('paymentMethod', paymentMethod)
          ..add('paidDateTime', paidDateTime)
          ..add('supplier', supplier)
          ..add('recurring', recurring)
          ..add('receipt', receipt))
        .toString();
  }
}

class ExpenseDtoBuilder implements Builder<ExpenseDto, ExpenseDtoBuilder> {
  _$ExpenseDto? _$v;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  ExpenseCategoryDtoBuilder? _category;
  ExpenseCategoryDtoBuilder get category =>
      _$this._category ??= new ExpenseCategoryDtoBuilder();
  set category(ExpenseCategoryDtoBuilder? category) =>
      _$this._category = category;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(PaymentMethod? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  DateTime? _paidDateTime;
  DateTime? get paidDateTime => _$this._paidDateTime;
  set paidDateTime(DateTime? paidDateTime) =>
      _$this._paidDateTime = paidDateTime;

  String? _supplier;
  String? get supplier => _$this._supplier;
  set supplier(String? supplier) => _$this._supplier = supplier;

  String? _recurring;
  String? get recurring => _$this._recurring;
  set recurring(String? recurring) => _$this._recurring = recurring;

  FileDtoBuilder? _receipt;
  FileDtoBuilder get receipt => _$this._receipt ??= new FileDtoBuilder();
  set receipt(FileDtoBuilder? receipt) => _$this._receipt = receipt;

  ExpenseDtoBuilder() {
    ExpenseDto._defaults(this);
  }

  ExpenseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _category = $v.category?.toBuilder();
      _id = $v.id;
      _notes = $v.notes;
      _paymentMethod = $v.paymentMethod;
      _paidDateTime = $v.paidDateTime;
      _supplier = $v.supplier;
       _recurring = $v.recurring;
      _receipt = $v.receipt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseDto;
  }

  @override
  void update(void Function(ExpenseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseDto build() => _build();

  _$ExpenseDto _build() {
    _$ExpenseDto _$result;
    try {
      _$result = _$v ??
          new _$ExpenseDto._(
              amount: BuiltValueNullFieldError.checkNotNull(
                  amount, r'ExpenseDto', 'amount'),
              category: _category?.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ExpenseDto', 'id'),
              notes: notes,
              paymentMethod: BuiltValueNullFieldError.checkNotNull(
                  paymentMethod, r'ExpenseDto', 'paymentMethod'),
              paidDateTime: BuiltValueNullFieldError.checkNotNull(
                  paidDateTime, r'ExpenseDto', 'paidDateTime'),
              supplier: supplier,
              recurring:recurring,
              receipt: _receipt?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();

        _$failedField = 'receipt';
        _receipt?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExpenseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
