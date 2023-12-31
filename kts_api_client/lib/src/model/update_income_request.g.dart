// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeRequest extends UpdateIncomeRequest {
  @override
  final int id;
  @override
  final String? description;
  @override
  final num amount;
  @override
  final PaymentMethod? paymentMethod;
  @override
  final DateTime paymentDateTime;

  factory _$UpdateIncomeRequest(
          [void Function(UpdateIncomeRequestBuilder)? updates]) =>
      (new UpdateIncomeRequestBuilder()..update(updates))._build();

  _$UpdateIncomeRequest._(
      {required this.id,
      this.description,
      required this.amount,
      this.paymentMethod,
      required this.paymentDateTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateIncomeRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'UpdateIncomeRequest', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        paymentDateTime, r'UpdateIncomeRequest', 'paymentDateTime');
  }

  @override
  UpdateIncomeRequest rebuild(
          void Function(UpdateIncomeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeRequestBuilder toBuilder() =>
      new UpdateIncomeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeRequest &&
        id == other.id &&
        description == other.description &&
        amount == other.amount &&
        paymentMethod == other.paymentMethod &&
        paymentDateTime == other.paymentDateTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentDateTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIncomeRequest')
          ..add('id', id)
          ..add('description', description)
          ..add('amount', amount)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentDateTime', paymentDateTime))
        .toString();
  }
}

class UpdateIncomeRequestBuilder
    implements Builder<UpdateIncomeRequest, UpdateIncomeRequestBuilder> {
  _$UpdateIncomeRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(PaymentMethod? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  DateTime? _paymentDateTime;
  DateTime? get paymentDateTime => _$this._paymentDateTime;
  set paymentDateTime(DateTime? paymentDateTime) =>
      _$this._paymentDateTime = paymentDateTime;

  UpdateIncomeRequestBuilder() {
    UpdateIncomeRequest._defaults(this);
  }

  UpdateIncomeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _description = $v.description;
      _amount = $v.amount;
      _paymentMethod = $v.paymentMethod;
      _paymentDateTime = $v.paymentDateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeRequest;
  }

  @override
  void update(void Function(UpdateIncomeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeRequest build() => _build();

  _$UpdateIncomeRequest _build() {
    final _$result = _$v ??
        new _$UpdateIncomeRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateIncomeRequest', 'id'),
            description: description,
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'UpdateIncomeRequest', 'amount'),
            paymentMethod: paymentMethod,
            paymentDateTime: BuiltValueNullFieldError.checkNotNull(
                paymentDateTime, r'UpdateIncomeRequest', 'paymentDateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
