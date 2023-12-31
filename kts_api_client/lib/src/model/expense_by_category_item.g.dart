// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_by_category_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpenseByCategoryItem extends ExpenseByCategoryItem {
  @override
  final ExpenseCategoryDto? category;
  @override
  final num total;

  factory _$ExpenseByCategoryItem(
          [void Function(ExpenseByCategoryItemBuilder)? updates]) =>
      (new ExpenseByCategoryItemBuilder()..update(updates))._build();

  _$ExpenseByCategoryItem._({this.category, required this.total}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        total, r'ExpenseByCategoryItem', 'total');
  }

  @override
  ExpenseByCategoryItem rebuild(
          void Function(ExpenseByCategoryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseByCategoryItemBuilder toBuilder() =>
      new ExpenseByCategoryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpenseByCategoryItem &&
        category == other.category &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExpenseByCategoryItem')
          ..add('category', category)
          ..add('total', total))
        .toString();
  }
}

class ExpenseByCategoryItemBuilder
    implements Builder<ExpenseByCategoryItem, ExpenseByCategoryItemBuilder> {
  _$ExpenseByCategoryItem? _$v;

  ExpenseCategoryDtoBuilder? _category;
  ExpenseCategoryDtoBuilder get category =>
      _$this._category ??= new ExpenseCategoryDtoBuilder();
  set category(ExpenseCategoryDtoBuilder? category) =>
      _$this._category = category;

  num? _total;
  num? get total => _$this._total;
  set total(num? total) => _$this._total = total;

  ExpenseByCategoryItemBuilder() {
    ExpenseByCategoryItem._defaults(this);
  }

  ExpenseByCategoryItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category?.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpenseByCategoryItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpenseByCategoryItem;
  }

  @override
  void update(void Function(ExpenseByCategoryItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpenseByCategoryItem build() => _build();

  _$ExpenseByCategoryItem _build() {
    _$ExpenseByCategoryItem _$result;
    try {
      _$result = _$v ??
          new _$ExpenseByCategoryItem._(
              category: _category?.build(),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'ExpenseByCategoryItem', 'total'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExpenseByCategoryItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
