// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cusotmer_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCusotmerResponse extends UpdateCusotmerResponse {
  @override
  final int id;

  factory _$UpdateCusotmerResponse(
          [void Function(UpdateCusotmerResponseBuilder)? updates]) =>
      (new UpdateCusotmerResponseBuilder()..update(updates))._build();

  _$UpdateCusotmerResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateCusotmerResponse', 'id');
  }

  @override
  UpdateCusotmerResponse rebuild(
          void Function(UpdateCusotmerResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCusotmerResponseBuilder toBuilder() =>
      new UpdateCusotmerResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCusotmerResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'UpdateCusotmerResponse')
          ..add('id', id))
        .toString();
  }
}

class UpdateCusotmerResponseBuilder
    implements Builder<UpdateCusotmerResponse, UpdateCusotmerResponseBuilder> {
  _$UpdateCusotmerResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UpdateCusotmerResponseBuilder() {
    UpdateCusotmerResponse._defaults(this);
  }

  UpdateCusotmerResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCusotmerResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCusotmerResponse;
  }

  @override
  void update(void Function(UpdateCusotmerResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCusotmerResponse build() => _build();

  _$UpdateCusotmerResponse _build() {
    final _$result = _$v ??
        new _$UpdateCusotmerResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateCusotmerResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
