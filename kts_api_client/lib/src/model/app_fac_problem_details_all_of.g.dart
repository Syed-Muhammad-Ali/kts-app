// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_fac_problem_details_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class AppFacProblemDetailsAllOfBuilder {
  void replace(AppFacProblemDetailsAllOf other);
  void update(void Function(AppFacProblemDetailsAllOfBuilder) updates);
  ListBuilder<String> get errors;
  set errors(ListBuilder<String>? errors);
}

class _$$AppFacProblemDetailsAllOf extends $AppFacProblemDetailsAllOf {
  @override
  final BuiltList<String> errors;

  factory _$$AppFacProblemDetailsAllOf(
          [void Function($AppFacProblemDetailsAllOfBuilder)? updates]) =>
      (new $AppFacProblemDetailsAllOfBuilder()..update(updates))._build();

  _$$AppFacProblemDetailsAllOf._({required this.errors}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        errors, r'$AppFacProblemDetailsAllOf', 'errors');
  }

  @override
  $AppFacProblemDetailsAllOf rebuild(
          void Function($AppFacProblemDetailsAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $AppFacProblemDetailsAllOfBuilder toBuilder() =>
      new $AppFacProblemDetailsAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $AppFacProblemDetailsAllOf && errors == other.errors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$AppFacProblemDetailsAllOf')
          ..add('errors', errors))
        .toString();
  }
}

class $AppFacProblemDetailsAllOfBuilder
    implements
        Builder<$AppFacProblemDetailsAllOf, $AppFacProblemDetailsAllOfBuilder>,
        AppFacProblemDetailsAllOfBuilder {
  _$$AppFacProblemDetailsAllOf? _$v;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(covariant ListBuilder<String>? errors) => _$this._errors = errors;

  $AppFacProblemDetailsAllOfBuilder() {
    $AppFacProblemDetailsAllOf._defaults(this);
  }

  $AppFacProblemDetailsAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errors = $v.errors.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $AppFacProblemDetailsAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$AppFacProblemDetailsAllOf;
  }

  @override
  void update(void Function($AppFacProblemDetailsAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $AppFacProblemDetailsAllOf build() => _build();

  _$$AppFacProblemDetailsAllOf _build() {
    _$$AppFacProblemDetailsAllOf _$result;
    try {
      _$result =
          _$v ?? new _$$AppFacProblemDetailsAllOf._(errors: errors.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        errors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$AppFacProblemDetailsAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
