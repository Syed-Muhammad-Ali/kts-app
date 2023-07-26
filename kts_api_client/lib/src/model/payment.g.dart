// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Payment extends Payment {
  @override
  final DateTime paymentDateTime;
  @override
  final num amount;
  @override
  final PaymentMethod paymentMethod;

  factory _$Payment([void Function(PaymentBuilder)? updates]) =>
      (new PaymentBuilder()..update(updates))._build();

  _$Payment._(
      {required this.paymentDateTime,
      required this.amount,
      required this.paymentMethod})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        paymentDateTime, r'Payment', 'paymentDateTime');
    BuiltValueNullFieldError.checkNotNull(amount, r'Payment', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        paymentMethod, r'Payment', 'paymentMethod');
  }

  @override
  Payment rebuild(void Function(PaymentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentBuilder toBuilder() => new PaymentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Payment &&
        paymentDateTime == other.paymentDateTime &&
        amount == other.amount &&
        paymentMethod == other.paymentMethod;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentDateTime.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Payment')
          ..add('paymentDateTime', paymentDateTime)
          ..add('amount', amount)
          ..add('paymentMethod', paymentMethod))
        .toString();
  }
}

class PaymentBuilder implements Builder<Payment, PaymentBuilder> {
  _$Payment? _$v;

  DateTime? _paymentDateTime;
  DateTime? get paymentDateTime => _$this._paymentDateTime;
  set paymentDateTime(DateTime? paymentDateTime) =>
      _$this._paymentDateTime = paymentDateTime;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(PaymentMethod? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  PaymentBuilder() {
    Payment._defaults(this);
  }

  PaymentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentDateTime = $v.paymentDateTime;
      _amount = $v.amount;
      _paymentMethod = $v.paymentMethod;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Payment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Payment;
  }

  @override
  void update(void Function(PaymentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Payment build() => _build();

  _$Payment _build() {
    final _$result = _$v ??
        new _$Payment._(
            paymentDateTime: BuiltValueNullFieldError.checkNotNull(
                paymentDateTime, r'Payment', 'paymentDateTime'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'Payment', 'amount'),
            paymentMethod: BuiltValueNullFieldError.checkNotNull(
                paymentMethod, r'Payment', 'paymentMethod'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
