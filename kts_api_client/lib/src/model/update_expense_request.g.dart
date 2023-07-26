// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseRequest extends UpdateExpenseRequest {
  @override
  final int id;
  @override
  final DateTime paidDateTime;
  @override
  final num amount;
  @override
  final int categoryId;
  @override
  final String? notes;
  @override
  final PaymentMethod paymentMethod;
  @override
  final int? recieptId;
  @override
  final String? supplier;

  factory _$UpdateExpenseRequest(
          [void Function(UpdateExpenseRequestBuilder)? updates]) =>
      (new UpdateExpenseRequestBuilder()..update(updates))._build();

  _$UpdateExpenseRequest._(
      {required this.id,
      required this.paidDateTime,
      required this.amount,
      required this.categoryId,
      this.notes,
      required this.paymentMethod,
      this.recieptId,
      this.supplier})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateExpenseRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(
        paidDateTime, r'UpdateExpenseRequest', 'paidDateTime');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'UpdateExpenseRequest', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'UpdateExpenseRequest', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(
        paymentMethod, r'UpdateExpenseRequest', 'paymentMethod');
  }

  @override
  UpdateExpenseRequest rebuild(
          void Function(UpdateExpenseRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseRequestBuilder toBuilder() =>
      new UpdateExpenseRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseRequest &&
        id == other.id &&
        paidDateTime == other.paidDateTime &&
        amount == other.amount &&
        categoryId == other.categoryId &&
        notes == other.notes &&
        paymentMethod == other.paymentMethod &&
        recieptId == other.recieptId &&
        supplier == other.supplier;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, paidDateTime.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, recieptId.hashCode);
    _$hash = $jc(_$hash, supplier.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateExpenseRequest')
          ..add('id', id)
          ..add('paidDateTime', paidDateTime)
          ..add('amount', amount)
          ..add('categoryId', categoryId)
          ..add('notes', notes)
          ..add('paymentMethod', paymentMethod)
          ..add('recieptId', recieptId)
          ..add('supplier', supplier))
        .toString();
  }
}

class UpdateExpenseRequestBuilder
    implements Builder<UpdateExpenseRequest, UpdateExpenseRequestBuilder> {
  _$UpdateExpenseRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _paidDateTime;
  DateTime? get paidDateTime => _$this._paidDateTime;
  set paidDateTime(DateTime? paidDateTime) =>
      _$this._paidDateTime = paidDateTime;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(PaymentMethod? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  int? _recieptId;
  int? get recieptId => _$this._recieptId;
  set recieptId(int? recieptId) => _$this._recieptId = recieptId;

  String? _supplier;
  String? get supplier => _$this._supplier;
  set supplier(String? supplier) => _$this._supplier = supplier;

  UpdateExpenseRequestBuilder() {
    UpdateExpenseRequest._defaults(this);
  }

  UpdateExpenseRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _paidDateTime = $v.paidDateTime;
      _amount = $v.amount;
      _categoryId = $v.categoryId;
      _notes = $v.notes;
      _paymentMethod = $v.paymentMethod;
      _recieptId = $v.recieptId;
      _supplier = $v.supplier;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseRequest;
  }

  @override
  void update(void Function(UpdateExpenseRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseRequest build() => _build();

  _$UpdateExpenseRequest _build() {
    final _$result = _$v ??
        new _$UpdateExpenseRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateExpenseRequest', 'id'),
            paidDateTime: BuiltValueNullFieldError.checkNotNull(
                paidDateTime, r'UpdateExpenseRequest', 'paidDateTime'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'UpdateExpenseRequest', 'amount'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'UpdateExpenseRequest', 'categoryId'),
            notes: notes,
            paymentMethod: BuiltValueNullFieldError.checkNotNull(
                paymentMethod, r'UpdateExpenseRequest', 'paymentMethod'),
            recieptId: recieptId,
            supplier: supplier);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
