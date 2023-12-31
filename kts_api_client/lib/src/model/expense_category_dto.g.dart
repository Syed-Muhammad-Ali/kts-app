// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseCategoryDto extends ExpenseCategoryDto {
  @override
  final int id;
  @override
  final String? name;
  @override
  final String? helpText;
  @override
  final String? helpUrl;
  @override
  final String? placeHolderExampleText;

  factory _$ExpenseCategoryDto(
          [void Function(ExpenseCategoryDtoBuilder)? updates]) =>
      (new ExpenseCategoryDtoBuilder()..update(updates))._build();

  _$ExpenseCategoryDto._(
      {required this.id,
      this.name,
      this.helpText,
      this.helpUrl,
      this.placeHolderExampleText})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ExpenseCategoryDto', 'id');
  }

  @override
  ExpenseCategoryDto rebuild(
          void Function(ExpenseCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseCategoryDtoBuilder toBuilder() =>
      new ExpenseCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseCategoryDto &&
        id == other.id &&
        name == other.name &&
        helpText == other.helpText &&
        helpUrl == other.helpUrl &&
        placeHolderExampleText == other.placeHolderExampleText;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, helpText.hashCode);
    _$hash = $jc(_$hash, helpUrl.hashCode);
    _$hash = $jc(_$hash, placeHolderExampleText.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseCategoryDto')
          ..add('id', id)
          ..add('name', name)
          ..add('helpText', helpText)
          ..add('helpUrl', helpUrl)
          ..add('placeHolderExampleText', placeHolderExampleText))
        .toString();
  }
}

class ExpenseCategoryDtoBuilder
    implements Builder<ExpenseCategoryDto, ExpenseCategoryDtoBuilder> {
  _$ExpenseCategoryDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _helpText;
  String? get helpText => _$this._helpText;
  set helpText(String? helpText) => _$this._helpText = helpText;

  String? _helpUrl;
  String? get helpUrl => _$this._helpUrl;
  set helpUrl(String? helpUrl) => _$this._helpUrl = helpUrl;

  String? _placeHolderExampleText;
  String? get placeHolderExampleText => _$this._placeHolderExampleText;
  set placeHolderExampleText(String? placeHolderExampleText) =>
      _$this._placeHolderExampleText = placeHolderExampleText;

  ExpenseCategoryDtoBuilder() {
    ExpenseCategoryDto._defaults(this);
  }

  ExpenseCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _helpText = $v.helpText;
      _helpUrl = $v.helpUrl;
      _placeHolderExampleText = $v.placeHolderExampleText;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseCategoryDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseCategoryDto;
  }

  @override
  void update(void Function(ExpenseCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseCategoryDto build() => _build();

  _$ExpenseCategoryDto _build() {
    final _$result = _$v ??
        new _$ExpenseCategoryDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ExpenseCategoryDto', 'id'),
            name: name,
            helpText: helpText,
            helpUrl: helpUrl,
            placeHolderExampleText: placeHolderExampleText);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
