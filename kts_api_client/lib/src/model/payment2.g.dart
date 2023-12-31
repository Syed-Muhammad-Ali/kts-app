// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment2.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Payment2 extends Payment2 {
  @override
  final DateTime paymentDateTime;
  @override
  final num amount;
  @override
  final PaymentMethod paymentMethod;

  factory _$Payment2([void Function(Payment2Builder)? updates]) =>
      (new Payment2Builder()..update(updates))._build();

  _$Payment2._(
      {required this.paymentDateTime,
      required this.amount,
      required this.paymentMethod})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        paymentDateTime, r'Payment2', 'paymentDateTime');
    BuiltValueNullFieldError.checkNotNull(amount, r'Payment2', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        paymentMethod, r'Payment2', 'paymentMethod');
  }

  @override
  Payment2 rebuild(void Function(Payment2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Payment2Builder toBuilder() => new Payment2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Payment2 &&
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
    return (newBuiltValueToStringHelper(r'Payment2')
          ..add('paymentDateTime', paymentDateTime)
          ..add('amount', amount)
          ..add('paymentMethod', paymentMethod))
        .toString();
  }
}

class Payment2Builder implements Builder<Payment2, Payment2Builder> {
  _$Payment2? _$v;

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

  Payment2Builder() {
    Payment2._defaults(this);
  }

  Payment2Builder get _$this {
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
  void replace(Payment2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Payment2;
  }

  @override
  void update(void Function(Payment2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Payment2 build() => _build();

  _$Payment2 _build() {
    final _$result = _$v ??
        new _$Payment2._(
            paymentDateTime: BuiltValueNullFieldError.checkNotNull(
                paymentDateTime, r'Payment2', 'paymentDateTime'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'Payment2', 'amount'),
            paymentMethod: BuiltValueNullFieldError.checkNotNull(
                paymentMethod, r'Payment2', 'paymentMethod'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
