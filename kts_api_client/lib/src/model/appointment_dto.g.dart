// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: override_on_non_overriding_member

part of 'appointment_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppointmentDto extends AppointmentDto {
  @override
  final int id;
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final CustomerDto? customer;
  @override
  final ServiceDto? services;
  @override
  final num cost;
  @override
  final num deposit;
  @override
  final num remainingBalance;
  @override
  final int tip;
 

  factory _$AppointmentDto([void Function(AppointmentDtoBuilder)? updates]) =>
      (new AppointmentDtoBuilder()..update(updates))._build();

  _$AppointmentDto._(
      {required this.id,
      required this.startDateTime,
      required this.endDateTime,
      this.customer,
      this.services,
      required this.cost,
      required this.deposit,
      required this.remainingBalance,
      required this.tip
      })
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AppointmentDto', 'id');
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'AppointmentDto', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'AppointmentDto', 'endDateTime');
    BuiltValueNullFieldError.checkNotNull(cost, r'AppointmentDto', 'cost');
    BuiltValueNullFieldError.checkNotNull(
        deposit, r'AppointmentDto', 'deposit');
    BuiltValueNullFieldError.checkNotNull(
        remainingBalance, r'AppointmentDto', 'remainingBalance');
    BuiltValueNullFieldError.checkNotNull(tip, r'AppointmentDto', 'tip');
  }

  @override
  AppointmentDto rebuild(void Function(AppointmentDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppointmentDtoBuilder toBuilder() =>
      new AppointmentDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentDto &&
        id == other.id &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime &&
        customer == other.customer &&
        services == other.services &&
        cost == other.cost &&
        deposit == other.deposit &&
        remainingBalance == other.remainingBalance ;
        // &&
        // tip == other.tip; // Check for 'tip
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, startDateTime.hashCode);
    _$hash = $jc(_$hash, endDateTime.hashCode);
    _$hash = $jc(_$hash, customer.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, deposit.hashCode);
    _$hash = $jc(_$hash, remainingBalance.hashCode);
    _$hash = $jc(_$hash, tip.hashCode); // Include 'tip' in the hashCode calculation
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppointmentDto')
          ..add('id', id)
          ..add('startDateTime', startDateTime)
          ..add('endDateTime', endDateTime)
          ..add('customer', customer)
          ..add('services', services)
          ..add('cost', cost)
          ..add('deposit', deposit)
          ..add('remainingBalance', remainingBalance)
          // ..add('tip', tip)
          ).toString();
  }
}

class AppointmentDtoBuilder
    implements Builder<AppointmentDto, AppointmentDtoBuilder> {
  _$AppointmentDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;
  

  DateTime? _startDateTime;
  DateTime? get startDateTime => _$this._startDateTime;
  set startDateTime(DateTime? startDateTime) =>
      _$this._startDateTime = startDateTime;

  DateTime? _endDateTime;
  DateTime? get endDateTime => _$this._endDateTime;
  set endDateTime(DateTime? endDateTime) => _$this._endDateTime = endDateTime;

  CustomerDtoBuilder? _customer;
  CustomerDtoBuilder get customer =>
      _$this._customer ??= new CustomerDtoBuilder();
  set customer(CustomerDtoBuilder? customer) => _$this._customer = customer;

  ServiceDtoBuilder? _services;
  ServiceDtoBuilder get services =>
      _$this._services ??= new ServiceDtoBuilder();
  set services(ServiceDtoBuilder? services) => _$this._services = services;

  num? _cost;
  num? get cost => _$this._cost;
  set cost(num? cost) => _$this._cost = cost;

  num? _deposit;
  num? get deposit => _$this._deposit;
  set deposit(num? deposit) => _$this._deposit = deposit;

  num? _remainingBalance;
  num? get remainingBalance => _$this._remainingBalance;
  set remainingBalance(num? remainingBalance) =>
      _$this._remainingBalance = remainingBalance;
  
  int? _tip;
  int? get tip => _$this._tip;
  set tip(int? tip) => _$this._tip = tip;

  AppointmentDtoBuilder() {
    AppointmentDto._defaults(this);
  }

  AppointmentDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _startDateTime = $v.startDateTime;
      _endDateTime = $v.endDateTime;
      _customer = $v.customer?.toBuilder();
      _services = $v.services?.toBuilder();
      _cost = $v.cost;
      _deposit = $v.deposit;
      _remainingBalance = $v.remainingBalance;
      _tip=$v.tip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppointmentDto;
  }

  @override
  void update(void Function(AppointmentDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppointmentDto build() => _build();

  _$AppointmentDto _build() {
    _$AppointmentDto _$result;
    try {
      _$result = _$v ??
          new _$AppointmentDto._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'AppointmentDto', 'id'),
              startDateTime: BuiltValueNullFieldError.checkNotNull(
                  startDateTime, r'AppointmentDto', 'startDateTime'),
              endDateTime: BuiltValueNullFieldError.checkNotNull(
                  endDateTime, r'AppointmentDto', 'endDateTime'),
              customer: _customer?.build(),
              services: _services?.build(),
              cost: BuiltValueNullFieldError.checkNotNull(
                  cost, r'AppointmentDto', 'cost'),
              deposit: BuiltValueNullFieldError.checkNotNull(
                  deposit, r'AppointmentDto', 'deposit'),
              remainingBalance: BuiltValueNullFieldError.checkNotNull(
                  remainingBalance, r'AppointmentDto', 'remainingBalance'),
              tip: BuiltValueNullFieldError.checkNotNull(
                  tip, r'AppointmentDto', 'tip')    
                  );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'customer';
        _customer?.build();
        _$failedField = 'services';
        _services?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppointmentDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
