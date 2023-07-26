// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_fac_problem_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppFacProblemDetails extends AppFacProblemDetails {
  @override
  final BuiltList<String> errors;
  @override
  final String? type;
  @override
  final String? title;
  @override
  final int? status;
  @override
  final String? detail;
  @override
  final String? instance;
  @override
  final BuiltMap<String, JsonObject> extensions;

  factory _$AppFacProblemDetails(
          [void Function(AppFacProblemDetailsBuilder)? updates]) =>
      (new AppFacProblemDetailsBuilder()..update(updates))._build();

  _$AppFacProblemDetails._(
      {required this.errors,
      this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      required this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        errors, r'AppFacProblemDetails', 'errors');
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'AppFacProblemDetails', 'extensions');
  }

  @override
  AppFacProblemDetails rebuild(
          void Function(AppFacProblemDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppFacProblemDetailsBuilder toBuilder() =>
      new AppFacProblemDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppFacProblemDetails &&
        errors == other.errors &&
        type == other.type &&
        title == other.title &&
        status == other.status &&
        detail == other.detail &&
        instance == other.instance &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, instance.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppFacProblemDetails')
          ..add('errors', errors)
          ..add('type', type)
          ..add('title', title)
          ..add('status', status)
          ..add('detail', detail)
          ..add('instance', instance)
          ..add('extensions', extensions))
        .toString();
  }
}

class AppFacProblemDetailsBuilder
    implements
        Builder<AppFacProblemDetails, AppFacProblemDetailsBuilder>,
        AppFacProblemDetailsAllOfBuilder,
        ProblemDetailsBuilder {
  _$AppFacProblemDetails? _$v;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(covariant ListBuilder<String>? errors) => _$this._errors = errors;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(covariant String? detail) => _$this._detail = detail;

  String? _instance;
  String? get instance => _$this._instance;
  set instance(covariant String? instance) => _$this._instance = instance;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  AppFacProblemDetailsBuilder() {
    AppFacProblemDetails._defaults(this);
  }

  AppFacProblemDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errors = $v.errors.toBuilder();
      _type = $v.type;
      _title = $v.title;
      _status = $v.status;
      _detail = $v.detail;
      _instance = $v.instance;
      _extensions = $v.extensions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant AppFacProblemDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppFacProblemDetails;
  }

  @override
  void update(void Function(AppFacProblemDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppFacProblemDetails build() => _build();

  _$AppFacProblemDetails _build() {
    _$AppFacProblemDetails _$result;
    try {
      _$result = _$v ??
          new _$AppFacProblemDetails._(
              errors: errors.build(),
              type: type,
              title: title,
              status: status,
              detail: detail,
              instance: instance,
              extensions: extensions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        errors.build();

        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppFacProblemDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
