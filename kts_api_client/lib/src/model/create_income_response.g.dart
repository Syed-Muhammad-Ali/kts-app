// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_income_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateIncomeResponse extends CreateIncomeResponse {
  @override
  final int id;

  factory _$CreateIncomeResponse(
          [void Function(CreateIncomeResponseBuilder)? updates]) =>
      (new CreateIncomeResponseBuilder()..update(updates))._build();

  _$CreateIncomeResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CreateIncomeResponse', 'id');
  }

  @override
  CreateIncomeResponse rebuild(
          void Function(CreateIncomeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateIncomeResponseBuilder toBuilder() =>
      new CreateIncomeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateIncomeResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'CreateIncomeResponse')..add('id', id))
        .toString();
  }
}

class CreateIncomeResponseBuilder
    implements Builder<CreateIncomeResponse, CreateIncomeResponseBuilder> {
  _$CreateIncomeResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CreateIncomeResponseBuilder() {
    CreateIncomeResponse._defaults(this);
  }

  CreateIncomeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateIncomeResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateIncomeResponse;
  }

  @override
  void update(void Function(CreateIncomeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateIncomeResponse build() => _build();

  _$CreateIncomeResponse _build() {
    final _$result = _$v ??
        new _$CreateIncomeResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CreateIncomeResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
