// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_appointment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAppointmentResponse extends GetAppointmentResponse {
  @override
  final BuiltList<AppointmentDto>? appointments;

  factory _$GetAppointmentResponse(
          [void Function(GetAppointmentResponseBuilder)? updates]) =>
      (new GetAppointmentResponseBuilder()..update(updates))._build();

  _$GetAppointmentResponse._({this.appointments}) : super._();

  @override
  GetAppointmentResponse rebuild(
          void Function(GetAppointmentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAppointmentResponseBuilder toBuilder() =>
      new GetAppointmentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAppointmentResponse &&
        appointments == other.appointments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appointments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAppointmentResponse')
          ..add('appointments', appointments))
        .toString();
  }
}

class GetAppointmentResponseBuilder
    implements Builder<GetAppointmentResponse, GetAppointmentResponseBuilder> {
  _$GetAppointmentResponse? _$v;

  ListBuilder<AppointmentDto>? _appointments;
  ListBuilder<AppointmentDto> get appointments =>
      _$this._appointments ??= new ListBuilder<AppointmentDto>();
  set appointments(ListBuilder<AppointmentDto>? appointments) =>
      _$this._appointments = appointments;

  GetAppointmentResponseBuilder() {
    GetAppointmentResponse._defaults(this);
  }

  GetAppointmentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appointments = $v.appointments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAppointmentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAppointmentResponse;
  }

  @override
  void update(void Function(GetAppointmentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAppointmentResponse build() => _build();

  _$GetAppointmentResponse _build() {
    _$GetAppointmentResponse _$result;
    try {
      _$result = _$v ??
          new _$GetAppointmentResponse._(appointments: _appointments?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'appointments';
        _appointments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetAppointmentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
