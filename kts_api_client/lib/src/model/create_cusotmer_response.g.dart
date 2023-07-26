// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cusotmer_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCusotmerResponse extends CreateCusotmerResponse {
  @override
  final int id;

  factory _$CreateCusotmerResponse(
          [void Function(CreateCusotmerResponseBuilder)? updates]) =>
      (new CreateCusotmerResponseBuilder()..update(updates))._build();

  _$CreateCusotmerResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CreateCusotmerResponse', 'id');
  }

  @override
  CreateCusotmerResponse rebuild(
          void Function(CreateCusotmerResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCusotmerResponseBuilder toBuilder() =>
      new CreateCusotmerResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCusotmerResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'CreateCusotmerResponse')
          ..add('id', id))
        .toString();
  }
}

class CreateCusotmerResponseBuilder
    implements Builder<CreateCusotmerResponse, CreateCusotmerResponseBuilder> {
  _$CreateCusotmerResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CreateCusotmerResponseBuilder() {
    CreateCusotmerResponse._defaults(this);
  }

  CreateCusotmerResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCusotmerResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateCusotmerResponse;
  }

  @override
  void update(void Function(CreateCusotmerResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCusotmerResponse build() => _build();

  _$CreateCusotmerResponse _build() {
    final _$result = _$v ??
        new _$CreateCusotmerResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CreateCusotmerResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
