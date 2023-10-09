// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAppointmentRequest extends CreateAppointmentRequest {
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final int customerId;
  @override
  final int serviceId;
  @override
  final num cost;
  @override
  final num depositAmount;
  @override
  final int tip;
  @override
  final BuiltList<Payment>? payments;

  factory _$CreateAppointmentRequest(
          [void Function(CreateAppointmentRequestBuilder)? updates]) =>
      (new CreateAppointmentRequestBuilder()..update(updates))._build();

  _$CreateAppointmentRequest._(
      {required this.startDateTime,
      required this.endDateTime,
      required this.customerId,
      required this.serviceId,
      required this.cost,
      required this.depositAmount,
      required this.tip,
      this.payments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'CreateAppointmentRequest', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'CreateAppointmentRequest', 'endDateTime');
    BuiltValueNullFieldError.checkNotNull(
        customerId, r'CreateAppointmentRequest', 'customerId');
    BuiltValueNullFieldError.checkNotNull(
        serviceId, r'CreateAppointmentRequest', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        cost, r'CreateAppointmentRequest', 'cost');
    BuiltValueNullFieldError.checkNotNull(
        depositAmount, r'CreateAppointmentRequest', 'depositAmount');
    BuiltValueNullFieldError.checkNotNull(
        tip, r'CreateAppointmentRequest', 'tip');
  }

  @override
  CreateAppointmentRequest rebuild(
          void Function(CreateAppointmentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAppointmentRequestBuilder toBuilder() =>
      new CreateAppointmentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAppointmentRequest &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime &&
        customerId == other.customerId &&
        serviceId == other.serviceId &&
        cost == other.cost &&
        depositAmount == other.depositAmount &&
        tip == other.tip &&
        payments == other.payments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startDateTime.hashCode);
    _$hash = $jc(_$hash, endDateTime.hashCode);
    _$hash = $jc(_$hash, customerId.hashCode);
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, depositAmount.hashCode);
    _$hash = $jc(_$hash, tip.hashCode);
    _$hash = $jc(_$hash, payments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAppointmentRequest')
          ..add('startDateTime', startDateTime)
          ..add('endDateTime', endDateTime)
          ..add('customerId', customerId)
          ..add('serviceId', serviceId)
          ..add('cost', cost)
          ..add('depositAmount', depositAmount)
          ..add('tip', tip)
          ..add('payments', payments))
        .toString();
  }
}

class CreateAppointmentRequestBuilder
    implements
        Builder<CreateAppointmentRequest, CreateAppointmentRequestBuilder> {
  _$CreateAppointmentRequest? _$v;

  DateTime? _startDateTime;
  DateTime? get startDateTime => _$this._startDateTime;
  set startDateTime(DateTime? startDateTime) =>
      _$this._startDateTime = startDateTime;

  DateTime? _endDateTime;
  DateTime? get endDateTime => _$this._endDateTime;
  set endDateTime(DateTime? endDateTime) => _$this._endDateTime = endDateTime;

  int? _customerId;
  int? get customerId => _$this._customerId;
  set customerId(int? customerId) => _$this._customerId = customerId;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  num? _cost;
  num? get cost => _$this._cost;
  set cost(num? cost) => _$this._cost = cost;

  num? _depositAmount;
  num? get depositAmount => _$this._depositAmount;
  set depositAmount(num? depositAmount) =>
      _$this._depositAmount = depositAmount;

  int? _tip;
  int? get tip => _$this._tip;
  set tip(int? _tip) => _$this._tip = _tip;

  ListBuilder<Payment>? _payments;
  ListBuilder<Payment> get payments =>
      _$this._payments ??= new ListBuilder<Payment>();
  set payments(ListBuilder<Payment>? payments) => _$this._payments = payments;

  CreateAppointmentRequestBuilder() {
    CreateAppointmentRequest._defaults(this);
  }

  CreateAppointmentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDateTime = $v.startDateTime;
      _endDateTime = $v.endDateTime;
      _customerId = $v.customerId;
      _serviceId = $v.serviceId;
      _cost = $v.cost;
      _depositAmount = $v.depositAmount;
      _tip = $v.tip;
      _payments = $v.payments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAppointmentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAppointmentRequest;
  }

  @override
  void update(void Function(CreateAppointmentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAppointmentRequest build() => _build();

  _$CreateAppointmentRequest _build() {
    _$CreateAppointmentRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateAppointmentRequest._(
              startDateTime: BuiltValueNullFieldError.checkNotNull(
                  startDateTime, r'CreateAppointmentRequest', 'startDateTime'),
              endDateTime: BuiltValueNullFieldError.checkNotNull(
                  endDateTime, r'CreateAppointmentRequest', 'endDateTime'),
              customerId: BuiltValueNullFieldError.checkNotNull(
                  customerId, r'CreateAppointmentRequest', 'customerId'),
              serviceId: BuiltValueNullFieldError.checkNotNull(
                  serviceId, r'CreateAppointmentRequest', 'serviceId'),
              cost: BuiltValueNullFieldError.checkNotNull(
                  cost, r'CreateAppointmentRequest', 'cost'),
              depositAmount: BuiltValueNullFieldError.checkNotNull(
                  depositAmount, r'CreateAppointmentRequest', 'depositAmount'),
              tip: BuiltValueNullFieldError.checkNotNull(
                  tip, r'CreateAppointmentRequest', 'tip'),
              payments: _payments?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'payments';
        _payments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateAppointmentRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
