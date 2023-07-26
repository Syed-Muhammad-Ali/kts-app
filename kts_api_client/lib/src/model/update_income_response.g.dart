// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_income_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIncomeResponse extends UpdateIncomeResponse {
  @override
  final int id;

  factory _$UpdateIncomeResponse(
          [void Function(UpdateIncomeResponseBuilder)? updates]) =>
      (new UpdateIncomeResponseBuilder()..update(updates))._build();

  _$UpdateIncomeResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateIncomeResponse', 'id');
  }

  @override
  UpdateIncomeResponse rebuild(
          void Function(UpdateIncomeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIncomeResponseBuilder toBuilder() =>
      new UpdateIncomeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIncomeResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'UpdateIncomeResponse')..add('id', id))
        .toString();
  }
}

class UpdateIncomeResponseBuilder
    implements Builder<UpdateIncomeResponse, UpdateIncomeResponseBuilder> {
  _$UpdateIncomeResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UpdateIncomeResponseBuilder() {
    UpdateIncomeResponse._defaults(this);
  }

  UpdateIncomeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIncomeResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateIncomeResponse;
  }

  @override
  void update(void Function(UpdateIncomeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIncomeResponse build() => _build();

  _$UpdateIncomeResponse _build() {
    final _$result = _$v ??
        new _$UpdateIncomeResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateIncomeResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
