// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServiceDto extends ServiceDto {
  @override
  final int id;
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

  factory _$ServiceDto([void Function(ServiceDtoBuilder)? updates]) =>
      (new ServiceDtoBuilder()..update(updates))._build();

  _$ServiceDto._(
      {required this.id,
      this.name,
      required this.totalPrice,
      required this.depositType,
      required this.deposit,
      this.defaultAppointmentDuration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ServiceDto', 'id');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, r'ServiceDto', 'totalPrice');
    BuiltValueNullFieldError.checkNotNull(
        depositType, r'ServiceDto', 'depositType');
    BuiltValueNullFieldError.checkNotNull(deposit, r'ServiceDto', 'deposit');
  }

  @override
  ServiceDto rebuild(void Function(ServiceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceDtoBuilder toBuilder() => new ServiceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceDto &&
        id == other.id &&
        name == other.name &&
        totalPrice == other.totalPrice &&
        depositType == other.depositType &&
        deposit == other.deposit &&
        defaultAppointmentDuration == other.defaultAppointmentDuration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
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
    return (newBuiltValueToStringHelper(r'ServiceDto')
          ..add('id', id)
          ..add('name', name)
          ..add('totalPrice', totalPrice)
          ..add('depositType', depositType)
          ..add('deposit', deposit)
          ..add('defaultAppointmentDuration', defaultAppointmentDuration))
        .toString();
  }
}

class ServiceDtoBuilder implements Builder<ServiceDto, ServiceDtoBuilder> {
  _$ServiceDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  ServiceDtoBuilder() {
    ServiceDto._defaults(this);
  }

  ServiceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
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
  void replace(ServiceDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceDto;
  }

  @override
  void update(void Function(ServiceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceDto build() => _build();

  _$ServiceDto _build() {
    final _$result = _$v ??
        new _$ServiceDto._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ServiceDto', 'id'),
            name: name,
            totalPrice: BuiltValueNullFieldError.checkNotNull(
                totalPrice, r'ServiceDto', 'totalPrice'),
            depositType: BuiltValueNullFieldError.checkNotNull(
                depositType, r'ServiceDto', 'depositType'),
            deposit: BuiltValueNullFieldError.checkNotNull(
                deposit, r'ServiceDto', 'deposit'),
            defaultAppointmentDuration: defaultAppointmentDuration);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
