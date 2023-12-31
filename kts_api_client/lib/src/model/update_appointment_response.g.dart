// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_appointment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAppointmentResponse extends UpdateAppointmentResponse {
  @override
  final int id;

  factory _$UpdateAppointmentResponse(
          [void Function(UpdateAppointmentResponseBuilder)? updates]) =>
      (new UpdateAppointmentResponseBuilder()..update(updates))._build();

  _$UpdateAppointmentResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'UpdateAppointmentResponse', 'id');
  }

  @override
  UpdateAppointmentResponse rebuild(
          void Function(UpdateAppointmentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAppointmentResponseBuilder toBuilder() =>
      new UpdateAppointmentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAppointmentResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'UpdateAppointmentResponse')
          ..add('id', id))
        .toString();
  }
}

class UpdateAppointmentResponseBuilder
    implements
        Builder<UpdateAppointmentResponse, UpdateAppointmentResponseBuilder> {
  _$UpdateAppointmentResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UpdateAppointmentResponseBuilder() {
    UpdateAppointmentResponse._defaults(this);
  }

  UpdateAppointmentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAppointmentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAppointmentResponse;
  }

  @override
  void update(void Function(UpdateAppointmentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAppointmentResponse build() => _build();

  _$UpdateAppointmentResponse _build() {
    final _$result = _$v ??
        new _$UpdateAppointmentResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateAppointmentResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
