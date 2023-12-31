// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class NotificationDtoBuilder {
  void replace(NotificationDto other);
  void update(void Function(NotificationDtoBuilder) updates);
  int? get id;
  set id(int? id);

  String? get header;
  set header(String? header);

  String? get message;
  set message(String? message);

  DateTime? get readDateTime;
  set readDateTime(DateTime? readDateTime);

  String? get discriminator;
  set discriminator(String? discriminator);
}

class _$$NotificationDto extends $NotificationDto {
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

  factory _$$NotificationDto(
          [void Function($NotificationDtoBuilder)? updates]) =>
      (new $NotificationDtoBuilder()..update(updates))._build();

  _$$NotificationDto._(
      {required this.id,
      this.header,
      this.message,
      this.readDateTime,
      required this.discriminator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'$NotificationDto', 'id');
    BuiltValueNullFieldError.checkNotNull(
        discriminator, r'$NotificationDto', 'discriminator');
  }

  @override
  $NotificationDto rebuild(void Function($NotificationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $NotificationDtoBuilder toBuilder() =>
      new $NotificationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $NotificationDto &&
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
    return (newBuiltValueToStringHelper(r'$NotificationDto')
          ..add('id', id)
          ..add('header', header)
          ..add('message', message)
          ..add('readDateTime', readDateTime)
          ..add('discriminator', discriminator))
        .toString();
  }
}

class $NotificationDtoBuilder
    implements
        Builder<$NotificationDto, $NotificationDtoBuilder>,
        NotificationDtoBuilder {
  _$$NotificationDto? _$v;

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

  $NotificationDtoBuilder() {
    $NotificationDto._defaults(this);
  }

  $NotificationDtoBuilder get _$this {
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
  void replace(covariant $NotificationDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$NotificationDto;
  }

  @override
  void update(void Function($NotificationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $NotificationDto build() => _build();

  _$$NotificationDto _build() {
    final _$result = _$v ??
        new _$$NotificationDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'$NotificationDto', 'id'),
            header: header,
            message: message,
            readDateTime: readDateTime,
            discriminator: BuiltValueNullFieldError.checkNotNull(
                discriminator, r'$NotificationDto', 'discriminator'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
