// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateExpenseResponse extends UpdateExpenseResponse {
  @override
  final int id;

  factory _$UpdateExpenseResponse(
          [void Function(UpdateExpenseResponseBuilder)? updates]) =>
      (new UpdateExpenseResponseBuilder()..update(updates))._build();

  _$UpdateExpenseResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateExpenseResponse', 'id');
  }

  @override
  UpdateExpenseResponse rebuild(
          void Function(UpdateExpenseResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateExpenseResponseBuilder toBuilder() =>
      new UpdateExpenseResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateExpenseResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'UpdateExpenseResponse')
          ..add('id', id))
        .toString();
  }
}

class UpdateExpenseResponseBuilder
    implements Builder<UpdateExpenseResponse, UpdateExpenseResponseBuilder> {
  _$UpdateExpenseResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UpdateExpenseResponseBuilder() {
    UpdateExpenseResponse._defaults(this);
  }

  UpdateExpenseResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateExpenseResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateExpenseResponse;
  }

  @override
  void update(void Function(UpdateExpenseResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateExpenseResponse build() => _build();

  _$UpdateExpenseResponse _build() {
    final _$result = _$v ??
        new _$UpdateExpenseResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateExpenseResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
