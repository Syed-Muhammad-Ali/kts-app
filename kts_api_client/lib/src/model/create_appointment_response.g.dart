// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAppointmentResponse extends CreateAppointmentResponse {
  @override
  final int id;

  factory _$CreateAppointmentResponse(
          [void Function(CreateAppointmentResponseBuilder)? updates]) =>
      (new CreateAppointmentResponseBuilder()..update(updates))._build();

  _$CreateAppointmentResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'CreateAppointmentResponse', 'id');
  }

  @override
  CreateAppointmentResponse rebuild(
          void Function(CreateAppointmentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAppointmentResponseBuilder toBuilder() =>
      new CreateAppointmentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAppointmentResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'CreateAppointmentResponse')
          ..add('id', id))
        .toString();
  }
}

class CreateAppointmentResponseBuilder
    implements
        Builder<CreateAppointmentResponse, CreateAppointmentResponseBuilder> {
  _$CreateAppointmentResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CreateAppointmentResponseBuilder() {
    CreateAppointmentResponse._defaults(this);
  }

  CreateAppointmentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAppointmentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAppointmentResponse;
  }

  @override
  void update(void Function(CreateAppointmentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAppointmentResponse build() => _build();

  _$CreateAppointmentResponse _build() {
    final _$result = _$v ??
        new _$CreateAppointmentResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CreateAppointmentResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
