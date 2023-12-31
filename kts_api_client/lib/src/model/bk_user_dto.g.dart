// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bk_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BkUserDto extends BkUserDto {
  @override
  final String? displayName;
  @override
  final String? username;

  factory _$BkUserDto([void Function(BkUserDtoBuilder)? updates]) =>
      (new BkUserDtoBuilder()..update(updates))._build();

  _$BkUserDto._({this.displayName, this.username}) : super._();

  @override
  BkUserDto rebuild(void Function(BkUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BkUserDtoBuilder toBuilder() => new BkUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BkUserDto &&
        displayName == other.displayName &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BkUserDto')
          ..add('displayName', displayName)
          ..add('username', username))
        .toString();
  }
}

class BkUserDtoBuilder implements Builder<BkUserDto, BkUserDtoBuilder> {
  _$BkUserDto? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  BkUserDtoBuilder() {
    BkUserDto._defaults(this);
  }

  BkUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BkUserDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BkUserDto;
  }

  @override
  void update(void Function(BkUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BkUserDto build() => _build();

  _$BkUserDto _build() {
    final _$result =
        _$v ?? new _$BkUserDto._(displayName: displayName, username: username);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
