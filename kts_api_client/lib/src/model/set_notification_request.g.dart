// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_notification_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetNotificationRequest extends SetNotificationRequest {
  @override
  final int id;

  factory _$SetNotificationRequest(
          [void Function(SetNotificationRequestBuilder)? updates]) =>
      (new SetNotificationRequestBuilder()..update(updates))._build();

  _$SetNotificationRequest._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SetNotificationRequest', 'id');
  }

  @override
  SetNotificationRequest rebuild(
          void Function(SetNotificationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetNotificationRequestBuilder toBuilder() =>
      new SetNotificationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetNotificationRequest && id == other.id;
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
    return (newBuiltValueToStringHelper(r'SetNotificationRequest')
          ..add('id', id))
        .toString();
  }
}

class SetNotificationRequestBuilder
    implements Builder<SetNotificationRequest, SetNotificationRequestBuilder> {
  _$SetNotificationRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  SetNotificationRequestBuilder() {
    SetNotificationRequest._defaults(this);
  }

  SetNotificationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetNotificationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetNotificationRequest;
  }

  @override
  void update(void Function(SetNotificationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetNotificationRequest build() => _build();

  _$SetNotificationRequest _build() {
    final _$result = _$v ??
        new _$SetNotificationRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SetNotificationRequest', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
