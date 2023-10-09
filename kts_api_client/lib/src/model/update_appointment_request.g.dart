// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_appointment_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAppointmentRequest extends UpdateAppointmentRequest {
  @override
  final int id;
  @override
  final int customerId;
  @override
  final int serviceId;
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final num depositAmount;
  @override
  final num cost;
  @override
  final int tip;
  @override
  final BuiltList<Payment2>? addPayments;
  @override
  final BuiltList<int>? removePayments;

  factory _$UpdateAppointmentRequest(
          [void Function(UpdateAppointmentRequestBuilder)? updates]) =>
      (new UpdateAppointmentRequestBuilder()..update(updates))._build();

  _$UpdateAppointmentRequest._(
      {required this.id,
      required this.customerId,
      required this.serviceId,
      required this.startDateTime,
      required this.endDateTime,
      required this.depositAmount,
      required this.cost,
      required this.tip,
      this.addPayments,
      this.removePayments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'UpdateAppointmentRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(
        customerId, r'UpdateAppointmentRequest', 'customerId');
    BuiltValueNullFieldError.checkNotNull(
        serviceId, r'UpdateAppointmentRequest', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'UpdateAppointmentRequest', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'UpdateAppointmentRequest', 'endDateTime');
    BuiltValueNullFieldError.checkNotNull(
        depositAmount, r'UpdateAppointmentRequest', 'depositAmount');
    BuiltValueNullFieldError.checkNotNull(
        cost, r'UpdateAppointmentRequest', 'cost');
    BuiltValueNullFieldError.checkNotNull(tip, r'AppointmentDto', 'tip');    
  }

  @override
  UpdateAppointmentRequest rebuild(
          void Function(UpdateAppointmentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAppointmentRequestBuilder toBuilder() =>
      new UpdateAppointmentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAppointmentRequest &&
        id == other.id &&
        customerId == other.customerId &&
        serviceId == other.serviceId &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime &&
        depositAmount == other.depositAmount &&
        cost == other.cost &&
        tip == other.tip && // Check for 'tip
        addPayments == other.addPayments &&
        removePayments == other.removePayments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, customerId.hashCode);
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, startDateTime.hashCode);
    _$hash = $jc(_$hash, endDateTime.hashCode);
    _$hash = $jc(_$hash, depositAmount.hashCode);
    _$hash = $jc(_$hash, cost.hashCode);
    _$hash = $jc(_$hash, tip.hashCode); // Include 'tip' in the hashCode calculation
    _$hash = $jc(_$hash, addPayments.hashCode);
    _$hash = $jc(_$hash, removePayments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateAppointmentRequest')
          ..add('id', id)
          ..add('customerId', customerId)
          ..add('serviceId', serviceId)
          ..add('startDateTime', startDateTime)
          ..add('endDateTime', endDateTime)
          ..add('depositAmount', depositAmount)
          ..add('cost', cost)
          ..add('tip', tip)
          ..add('addPayments', addPayments)
          ..add('removePayments', removePayments))
        .toString();
  }
}

class UpdateAppointmentRequestBuilder
    implements
        Builder<UpdateAppointmentRequest, UpdateAppointmentRequestBuilder> {
  _$UpdateAppointmentRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _customerId;
  int? get customerId => _$this._customerId;
  set customerId(int? customerId) => _$this._customerId = customerId;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  DateTime? _startDateTime;
  DateTime? get startDateTime => _$this._startDateTime;
  set startDateTime(DateTime? startDateTime) =>
      _$this._startDateTime = startDateTime;

  DateTime? _endDateTime;
  DateTime? get endDateTime => _$this._endDateTime;
  set endDateTime(DateTime? endDateTime) => _$this._endDateTime = endDateTime;

  num? _depositAmount;
  num? get depositAmount => _$this._depositAmount;
  set depositAmount(num? depositAmount) =>
      _$this._depositAmount = depositAmount;

  num? _cost;
  num? get cost => _$this._cost;
  set cost(num? cost) => _$this._cost = cost;

  int? _tip;
  int? get tip => _$this._tip;
  set tip(int? tip) => _$this._tip = tip;

  ListBuilder<Payment2>? _addPayments;
  ListBuilder<Payment2> get addPayments =>
      _$this._addPayments ??= new ListBuilder<Payment2>();
  set addPayments(ListBuilder<Payment2>? addPayments) =>
      _$this._addPayments = addPayments;

  ListBuilder<int>? _removePayments;
  ListBuilder<int> get removePayments =>
      _$this._removePayments ??= new ListBuilder<int>();
  set removePayments(ListBuilder<int>? removePayments) =>
      _$this._removePayments = removePayments;

  UpdateAppointmentRequestBuilder() {
    UpdateAppointmentRequest._defaults(this);
  }

  UpdateAppointmentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _customerId = $v.customerId;
      _serviceId = $v.serviceId;
      _startDateTime = $v.startDateTime;
      _endDateTime = $v.endDateTime;
      _depositAmount = $v.depositAmount;
      _cost = $v.cost;
      _tip=$v.tip;
      _addPayments = $v.addPayments?.toBuilder();
      _removePayments = $v.removePayments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAppointmentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAppointmentRequest;
  }

  @override
  void update(void Function(UpdateAppointmentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAppointmentRequest build() => _build();

  _$UpdateAppointmentRequest _build() {
    _$UpdateAppointmentRequest _$result;
    try {
      _$result = _$v ??
          new _$UpdateAppointmentRequest._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'UpdateAppointmentRequest', 'id'),
              customerId: BuiltValueNullFieldError.checkNotNull(
                  customerId, r'UpdateAppointmentRequest', 'customerId'),
              serviceId: BuiltValueNullFieldError.checkNotNull(
                  serviceId, r'UpdateAppointmentRequest', 'serviceId'),
              startDateTime: BuiltValueNullFieldError.checkNotNull(
                  startDateTime, r'UpdateAppointmentRequest', 'startDateTime'),
              endDateTime: BuiltValueNullFieldError.checkNotNull(
                  endDateTime, r'UpdateAppointmentRequest', 'endDateTime'),
              depositAmount: BuiltValueNullFieldError.checkNotNull(
                  depositAmount, r'UpdateAppointmentRequest', 'depositAmount'),
              cost: BuiltValueNullFieldError.checkNotNull(
                  cost, r'UpdateAppointmentRequest', 'cost'), 
              tip: BuiltValueNullFieldError.checkNotNull(
                  tip, r'AppointmentDto', 'tip'),
              addPayments: _addPayments?.build(),
              removePayments: _removePayments?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'addPayments';
        _addPayments?.build();
        _$failedField = 'removePayments';
        _removePayments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateAppointmentRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
