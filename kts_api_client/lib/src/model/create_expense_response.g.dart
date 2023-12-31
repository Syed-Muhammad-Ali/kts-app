// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateExpenseResponse extends CreateExpenseResponse {
  @override
  final int id;

  factory _$CreateExpenseResponse(
          [void Function(CreateExpenseResponseBuilder)? updates]) =>
      (new CreateExpenseResponseBuilder()..update(updates))._build();

  _$CreateExpenseResponse._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CreateExpenseResponse', 'id');
  }

  @override
  CreateExpenseResponse rebuild(
          void Function(CreateExpenseResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateExpenseResponseBuilder toBuilder() =>
      new CreateExpenseResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateExpenseResponse && id == other.id;
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
    return (newBuiltValueToStringHelper(r'CreateExpenseResponse')
          ..add('id', id))
        .toString();
  }
}

class CreateExpenseResponseBuilder
    implements Builder<CreateExpenseResponse, CreateExpenseResponseBuilder> {
  _$CreateExpenseResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CreateExpenseResponseBuilder() {
    CreateExpenseResponse._defaults(this);
  }

  CreateExpenseResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateExpenseResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateExpenseResponse;
  }

  @override
  void update(void Function(CreateExpenseResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateExpenseResponse build() => _build();

  _$CreateExpenseResponse _build() {
    final _$result = _$v ??
        new _$CreateExpenseResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CreateExpenseResponse', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
