// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_appointment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitAppointmentResponse extends InitAppointmentResponse {
  @override
  final BuiltList<CustomerDto>? customers;
  @override
  final BuiltList<ServiceDto>? services;
  @override
  final BuiltList<IncomeDto>? income;
  @override
  final AppointmentDto? appointment;

  factory _$InitAppointmentResponse(
          [void Function(InitAppointmentResponseBuilder)? updates]) =>
      (new InitAppointmentResponseBuilder()..update(updates))._build();

  _$InitAppointmentResponse._(
      {this.customers, this.services, this.income, this.appointment})
      : super._();

  @override
  InitAppointmentResponse rebuild(
          void Function(InitAppointmentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitAppointmentResponseBuilder toBuilder() =>
      new InitAppointmentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitAppointmentResponse &&
        customers == other.customers &&
        services == other.services &&
        income == other.income &&
        appointment == other.appointment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, customers.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jc(_$hash, appointment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitAppointmentResponse')
          ..add('customers', customers)
          ..add('services', services)
          ..add('income', income)
          ..add('appointment', appointment))
        .toString();
  }
}

class InitAppointmentResponseBuilder
    implements
        Builder<InitAppointmentResponse, InitAppointmentResponseBuilder> {
  _$InitAppointmentResponse? _$v;

  ListBuilder<CustomerDto>? _customers;
  ListBuilder<CustomerDto> get customers =>
      _$this._customers ??= new ListBuilder<CustomerDto>();
  set customers(ListBuilder<CustomerDto>? customers) =>
      _$this._customers = customers;

  ListBuilder<ServiceDto>? _services;
  ListBuilder<ServiceDto> get services =>
      _$this._services ??= new ListBuilder<ServiceDto>();
  set services(ListBuilder<ServiceDto>? services) =>
      _$this._services = services;

  ListBuilder<IncomeDto>? _income;
  ListBuilder<IncomeDto> get income =>
      _$this._income ??= new ListBuilder<IncomeDto>();
  set income(ListBuilder<IncomeDto>? income) => _$this._income = income;

  AppointmentDtoBuilder? _appointment;
  AppointmentDtoBuilder get appointment =>
      _$this._appointment ??= new AppointmentDtoBuilder();
  set appointment(AppointmentDtoBuilder? appointment) =>
      _$this._appointment = appointment;

  InitAppointmentResponseBuilder() {
    InitAppointmentResponse._defaults(this);
  }

  InitAppointmentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customers = $v.customers?.toBuilder();
      _services = $v.services?.toBuilder();
      _income = $v.income?.toBuilder();
      _appointment = $v.appointment?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitAppointmentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitAppointmentResponse;
  }

  @override
  void update(void Function(InitAppointmentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitAppointmentResponse build() => _build();

  _$InitAppointmentResponse _build() {
    _$InitAppointmentResponse _$result;
    try {
      _$result = _$v ??
          new _$InitAppointmentResponse._(
              customers: _customers?.build(),
              services: _services?.build(),
              income: _income?.build(),
              appointment: _appointment?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'customers';
        _customers?.build();
        _$failedField = 'services';
        _services?.build();
        _$failedField = 'income';
        _income?.build();
        _$failedField = 'appointment';
        _appointment?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitAppointmentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
