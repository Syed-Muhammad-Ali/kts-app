// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_appointment_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CancelAppointmentRequest extends CancelAppointmentRequest {
  @override
  final int id;

  factory _$CancelAppointmentRequest(
          [void Function(CancelAppointmentRequestBuilder)? updates]) =>
      (new CancelAppointmentRequestBuilder()..update(updates))._build();

  _$CancelAppointmentRequest._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'CancelAppointmentRequest', 'id');
  }

  @override
  CancelAppointmentRequest rebuild(
          void Function(CancelAppointmentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CancelAppointmentRequestBuilder toBuilder() =>
      new CancelAppointmentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CancelAppointmentRequest && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CancelAppointmentRequest')
          ..add('id', id))
        .toString();
  }
}

class CancelAppointmentRequestBuilder
    implements
        Builder<CancelAppointmentRequest, CancelAppointmentRequestBuilder> {
  _$CancelAppointmentRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CancelAppointmentRequestBuilder() {
    CancelAppointmentRequest._defaults(this);
  }

  CancelAppointmentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CancelAppointmentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CancelAppointmentRequest;
  }

  @override
  void update(void Function(CancelAppointmentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CancelAppointmentRequest build() => _build();

  _$CancelAppointmentRequest _build() {
    final _$result = _$v ??
        new _$CancelAppointmentRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CancelAppointmentRequest', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
