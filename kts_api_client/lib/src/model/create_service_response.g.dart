// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateServiceResponse extends CreateServiceResponse {
  @override
  final int id;

  factory _$CreateServiceResponse(
          [void Function(CreateServiceResponseBuilder)? updates]) =>
      (new CreateServiceResponseBuilder()..update(updates))._build();

  _$CreateServiceResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CreateServiceResponse', 'id');
  }

  @override
  CreateServiceResponse rebuild(
          void Function(CreateServiceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateServiceResponseBuilder toBuilder() =>
      new CreateServiceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateServiceResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'CreateServiceResponse')
          ..add('id', id))
        .toString();
  }
}

class CreateServiceResponseBuilder
    implements Builder<CreateServiceResponse, CreateServiceResponseBuilder> {
  _$CreateServiceResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CreateServiceResponseBuilder() {
    CreateServiceResponse._defaults(this);
  }

  CreateServiceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateServiceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateServiceResponse;
  }

  @override
  void update(void Function(CreateServiceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateServiceResponse build() => _build();

  _$CreateServiceResponse _build() {
    final _$result = _$v ??
        new _$CreateServiceResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CreateServiceResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
