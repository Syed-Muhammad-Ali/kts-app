// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadFileResponse extends UploadFileResponse {
  @override
  final int id;

  factory _$UploadFileResponse(
          [void Function(UploadFileResponseBuilder)? updates]) =>
      (new UploadFileResponseBuilder()..update(updates))._build();

  _$UploadFileResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UploadFileResponse', 'id');
  }

  @override
  UploadFileResponse rebuild(
          void Function(UploadFileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadFileResponseBuilder toBuilder() =>
      new UploadFileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadFileResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'UploadFileResponse')..add('id', id))
        .toString();
  }
}

class UploadFileResponseBuilder
    implements Builder<UploadFileResponse, UploadFileResponseBuilder> {
  _$UploadFileResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UploadFileResponseBuilder() {
    UploadFileResponse._defaults(this);
  }

  UploadFileResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadFileResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadFileResponse;
  }

  @override
  void update(void Function(UploadFileResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadFileResponse build() => _build();

  _$UploadFileResponse _build() {
    final _$result = _$v ??
        new _$UploadFileResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UploadFileResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
