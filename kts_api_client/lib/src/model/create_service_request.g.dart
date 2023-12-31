// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateServiceRequest extends CreateServiceRequest {
  @override
  final String? name;
  @override
  final num totalPrice;
  @override
  final DepositType depositType;
  @override
  final num deposit;
  @override
  final int? defaultAppointmentDuration;

  factory _$CreateServiceRequest(
          [void Function(CreateServiceRequestBuilder)? updates]) =>
      (new CreateServiceRequestBuilder()..update(updates))._build();

  _$CreateServiceRequest._(
      {this.name,
      required this.totalPrice,
      required this.depositType,
      required this.deposit,
      this.defaultAppointmentDuration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, r'CreateServiceRequest', 'totalPrice');
    BuiltValueNullFieldError.checkNotNull(
        depositType, r'CreateServiceRequest', 'depositType');
    BuiltValueNullFieldError.checkNotNull(
        deposit, r'CreateServiceRequest', 'deposit');
  }

  @override
  CreateServiceRequest rebuild(
          void Function(CreateServiceRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateServiceRequestBuilder toBuilder() =>
      new CreateServiceRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateServiceRequest &&
        name == other.name &&
        totalPrice == other.totalPrice &&
        depositType == other.depositType &&
        deposit == other.deposit &&
        defaultAppointmentDuration == other.defaultAppointmentDuration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jc(_$hash, depositType.hashCode);
    _$hash = $jc(_$hash, deposit.hashCode);
    _$hash = $jc(_$hash, defaultAppointmentDuration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateServiceRequest')
          ..add('name', name)
          ..add('totalPrice', totalPrice)
          ..add('depositType', depositType)
          ..add('deposit', deposit)
          ..add('defaultAppointmentDuration', defaultAppointmentDuration))
        .toString();
  }
}

class CreateServiceRequestBuilder
    implements Builder<CreateServiceRequest, CreateServiceRequestBuilder> {
  _$CreateServiceRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  num? _totalPrice;
  num? get totalPrice => _$this._totalPrice;
  set totalPrice(num? totalPrice) => _$this._totalPrice = totalPrice;

  DepositType? _depositType;
  DepositType? get depositType => _$this._depositType;
  set depositType(DepositType? depositType) =>
      _$this._depositType = depositType;

  num? _deposit;
  num? get deposit => _$this._deposit;
  set deposit(num? deposit) => _$this._deposit = deposit;

  int? _defaultAppointmentDuration;
  int? get defaultAppointmentDuration => _$this._defaultAppointmentDuration;
  set defaultAppointmentDuration(int? defaultAppointmentDuration) =>
      _$this._defaultAppointmentDuration = defaultAppointmentDuration;

  CreateServiceRequestBuilder() {
    CreateServiceRequest._defaults(this);
  }

  CreateServiceRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _totalPrice = $v.totalPrice;
      _depositType = $v.depositType;
      _deposit = $v.deposit;
      _defaultAppointmentDuration = $v.defaultAppointmentDuration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateServiceRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateServiceRequest;
  }

  @override
  void update(void Function(CreateServiceRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateServiceRequest build() => _build();

  _$CreateServiceRequest _build() {
    final _$result = _$v ??
        new _$CreateServiceRequest._(
            name: name,
            totalPrice: BuiltValueNullFieldError.checkNotNull(
                totalPrice, r'CreateServiceRequest', 'totalPrice'),
            depositType: BuiltValueNullFieldError.checkNotNull(
                depositType, r'CreateServiceRequest', 'depositType'),
            deposit: BuiltValueNullFieldError.checkNotNull(
                deposit, r'CreateServiceRequest', 'deposit'),
            defaultAppointmentDuration: defaultAppointmentDuration);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
