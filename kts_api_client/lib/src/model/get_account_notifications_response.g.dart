// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_notifications_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAccountNotificationsResponse
    extends GetAccountNotificationsResponse {
  @override
  final BuiltList<NotificationDto>? notifications;

  factory _$GetAccountNotificationsResponse(
          [void Function(GetAccountNotificationsResponseBuilder)? updates]) =>
      (new GetAccountNotificationsResponseBuilder()..update(updates))._build();

  _$GetAccountNotificationsResponse._({this.notifications}) : super._();

  @override
  GetAccountNotificationsResponse rebuild(
          void Function(GetAccountNotificationsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAccountNotificationsResponseBuilder toBuilder() =>
      new GetAccountNotificationsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAccountNotificationsResponse &&
        notifications == other.notifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAccountNotificationsResponse')
          ..add('notifications', notifications))
        .toString();
  }
}

class GetAccountNotificationsResponseBuilder
    implements
        Builder<GetAccountNotificationsResponse,
            GetAccountNotificationsResponseBuilder> {
  _$GetAccountNotificationsResponse? _$v;

  ListBuilder<NotificationDto>? _notifications;
  ListBuilder<NotificationDto> get notifications =>
      _$this._notifications ??= new ListBuilder<NotificationDto>();
  set notifications(ListBuilder<NotificationDto>? notifications) =>
      _$this._notifications = notifications;

  GetAccountNotificationsResponseBuilder() {
    GetAccountNotificationsResponse._defaults(this);
  }

  GetAccountNotificationsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notifications = $v.notifications?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAccountNotificationsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAccountNotificationsResponse;
  }

  @override
  void update(void Function(GetAccountNotificationsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAccountNotificationsResponse build() => _build();

  _$GetAccountNotificationsResponse _build() {
    _$GetAccountNotificationsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetAccountNotificationsResponse._(
              notifications: _notifications?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        _notifications?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetAccountNotificationsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
