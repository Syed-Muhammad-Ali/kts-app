// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_income_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateIncomeRequest extends CreateIncomeRequest {
  @override
  final num amount;
  @override
  final String? description;
  @override
  final PaymentMethod? paymentMethod;
  @override
  final DateTime paymentDateTime;

  factory _$CreateIncomeRequest(
          [void Function(CreateIncomeRequestBuilder)? updates]) =>
      (new CreateIncomeRequestBuilder()..update(updates))._build();

  _$CreateIncomeRequest._(
      {required this.amount,
      this.description,
      this.paymentMethod,
      required this.paymentDateTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        amount, r'CreateIncomeRequest', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        paymentDateTime, r'CreateIncomeRequest', 'paymentDateTime');
  }

  @override
  CreateIncomeRequest rebuild(
          void Function(CreateIncomeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateIncomeRequestBuilder toBuilder() =>
      new CreateIncomeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateIncomeRequest &&
        amount == other.amount &&
        description == other.description &&
        paymentMethod == other.paymentMethod &&
        paymentDateTime == other.paymentDateTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentDateTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateIncomeRequest')
          ..add('amount', amount)
          ..add('description', description)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentDateTime', paymentDateTime))
        .toString();
  }
}

class CreateIncomeRequestBuilder
    implements Builder<CreateIncomeRequest, CreateIncomeRequestBuilder> {
  _$CreateIncomeRequest? _$v;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(PaymentMethod? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  DateTime? _paymentDateTime;
  DateTime? get paymentDateTime => _$this._paymentDateTime;
  set paymentDateTime(DateTime? paymentDateTime) =>
      _$this._paymentDateTime = paymentDateTime;

  CreateIncomeRequestBuilder() {
    CreateIncomeRequest._defaults(this);
  }

  CreateIncomeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _description = $v.description;
      _paymentMethod = $v.paymentMethod;
      _paymentDateTime = $v.paymentDateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateIncomeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateIncomeRequest;
  }

  @override
  void update(void Function(CreateIncomeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateIncomeRequest build() => _build();

  _$CreateIncomeRequest _build() {
    final _$result = _$v ??
        new _$CreateIncomeRequest._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'CreateIncomeRequest', 'amount'),
            description: description,
            paymentMethod: paymentMethod,
            paymentDateTime: BuiltValueNullFieldError.checkNotNull(
                paymentDateTime, r'CreateIncomeRequest', 'paymentDateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
