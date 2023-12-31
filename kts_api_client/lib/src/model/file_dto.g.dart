// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FileDto extends FileDto {
  @override
  final int id;
  @override
  final String? name;

  factory _$FileDto([void Function(FileDtoBuilder)? updates]) =>
      (new FileDtoBuilder()..update(updates))._build();

  _$FileDto._({required this.id, this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'FileDto', 'id');
  }

  @override
  FileDto rebuild(void Function(FileDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileDtoBuilder toBuilder() => new FileDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileDto && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FileDto')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class FileDtoBuilder implements Builder<FileDto, FileDtoBuilder> {
  _$FileDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FileDtoBuilder() {
    FileDto._defaults(this);
  }

  FileDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FileDto;
  }

  @override
  void update(void Function(FileDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FileDto build() => _build();

  _$FileDto _build() {
    final _$result = _$v ??
        new _$FileDto._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'FileDto', 'id'),
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
