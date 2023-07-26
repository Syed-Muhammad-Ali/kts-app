// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_notification_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WelcomeNotificationDto extends WelcomeNotificationDto {
  @override
  final int id;
  @override
  final String? header;
  @override
  final String? message;
  @override
  final DateTime? readDateTime;
  @override
  final String discriminator;

  factory _$WelcomeNotificationDto(
          [void Function(WelcomeNotificationDtoBuilder)? updates]) =>
      (new WelcomeNotificationDtoBuilder()..update(updates))._build();

  _$WelcomeNotificationDto._(
      {required this.id,
      this.header,
      this.message,
      this.readDateTime,
      required this.discriminator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'WelcomeNotificationDto', 'id');
    BuiltValueNullFieldError.checkNotNull(
        discriminator, r'WelcomeNotificationDto', 'discriminator');
  }

  @override
  WelcomeNotificationDto rebuild(
          void Function(WelcomeNotificationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WelcomeNotificationDtoBuilder toBuilder() =>
      new WelcomeNotificationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WelcomeNotificationDto &&
        id == other.id &&
        header == other.header &&
        message == other.message &&
        readDateTime == other.readDateTime &&
        discriminator == other.discriminator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, header.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, readDateTime.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WelcomeNotificationDto')
          ..add('id', id)
          ..add('header', header)
          ..add('message', message)
          ..add('readDateTime', readDateTime)
          ..add('discriminator', discriminator))
        .toString();
  }
}

class WelcomeNotificationDtoBuilder
    implements
        Builder<WelcomeNotificationDto, WelcomeNotificationDtoBuilder>,
        NotificationDtoBuilder {
  _$WelcomeNotificationDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _header;
  String? get header => _$this._header;
  set header(covariant String? header) => _$this._header = header;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  DateTime? _readDateTime;
  DateTime? get readDateTime => _$this._readDateTime;
  set readDateTime(covariant DateTime? readDateTime) =>
      _$this._readDateTime = readDateTime;

  String? _discriminator;
  String? get discriminator => _$this._discriminator;
  set discriminator(covariant String? discriminator) =>
      _$this._discriminator = discriminator;

  WelcomeNotificationDtoBuilder() {
    WelcomeNotificationDto._defaults(this);
  }

  WelcomeNotificationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _header = $v.header;
      _message = $v.message;
      _readDateTime = $v.readDateTime;
      _discriminator = $v.discriminator;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WelcomeNotificationDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WelcomeNotificationDto;
  }

  @override
  void update(void Function(WelcomeNotificationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WelcomeNotificationDto build() => _build();

  _$WelcomeNotificationDto _build() {
    final _$result = _$v ??
        new _$WelcomeNotificationDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'WelcomeNotificationDto', 'id'),
            header: header,
            message: message,
            readDateTime: readDateTime,
            discriminator: BuiltValueNullFieldError.checkNotNull(
                discriminator, r'WelcomeNotificationDto', 'discriminator'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
