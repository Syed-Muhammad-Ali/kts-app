// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IncomeDto extends IncomeDto {
  @override
  final int id;
  @override
  final num amount;
  @override
  final String? description;
  @override
  final PaymentMethod? paymentMethod;
  @override
  final DateTime paymentDateTime;

  factory _$IncomeDto([void Function(IncomeDtoBuilder)? updates]) =>
      (new IncomeDtoBuilder()..update(updates))._build();

  _$IncomeDto._(
      {required this.id,
      required this.amount,
      this.description,
      this.paymentMethod,
      required this.paymentDateTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'IncomeDto', 'id');
    BuiltValueNullFieldError.checkNotNull(amount, r'IncomeDto', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        paymentDateTime, r'IncomeDto', 'paymentDateTime');
  }

  @override
  IncomeDto rebuild(void Function(IncomeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeDtoBuilder toBuilder() => new IncomeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeDto &&
        id == other.id &&
        amount == other.amount &&
        description == other.description &&
        paymentMethod == other.paymentMethod &&
        paymentDateTime == other.paymentDateTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentDateTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncomeDto')
          ..add('id', id)
          ..add('amount', amount)
          ..add('description', description)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentDateTime', paymentDateTime))
        .toString();
  }
}

class IncomeDtoBuilder implements Builder<IncomeDto, IncomeDtoBuilder> {
  _$IncomeDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  IncomeDtoBuilder() {
    IncomeDto._defaults(this);
  }

  IncomeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _amount = $v.amount;
      _description = $v.description;
      _paymentMethod = $v.paymentMethod;
      _paymentDateTime = $v.paymentDateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeDto;
  }

  @override
  void update(void Function(IncomeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeDto build() => _build();

  _$IncomeDto _build() {
    final _$result = _$v ??
        new _$IncomeDto._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'IncomeDto', 'id'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'IncomeDto', 'amount'),
            description: description,
            paymentMethod: paymentMethod,
            paymentDateTime: BuiltValueNullFieldError.checkNotNull(
                paymentDateTime, r'IncomeDto', 'paymentDateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
