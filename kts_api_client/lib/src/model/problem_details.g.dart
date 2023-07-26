// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class ProblemDetailsBuilder {
  void replace(ProblemDetails other);
  void update(void Function(ProblemDetailsBuilder) updates);
  String? get type;
  set type(String? type);

  String? get title;
  set title(String? title);

  int? get status;
  set status(int? status);

  String? get detail;
  set detail(String? detail);

  String? get instance;
  set instance(String? instance);

  MapBuilder<String, JsonObject> get extensions;
  set extensions(MapBuilder<String, JsonObject>? extensions);
}

class _$$ProblemDetails extends $ProblemDetails {
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

  factory _$$ProblemDetails([void Function($ProblemDetailsBuilder)? updates]) =>
      (new $ProblemDetailsBuilder()..update(updates))._build();

  _$$ProblemDetails._(
      {this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      required this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        extensions, r'$ProblemDetails', 'extensions');
  }

  @override
  $ProblemDetails rebuild(void Function($ProblemDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ProblemDetailsBuilder toBuilder() =>
      new $ProblemDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ProblemDetails &&
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
    return (newBuiltValueToStringHelper(r'$ProblemDetails')
          ..add('type', type)
          ..add('title', title)
          ..add('status', status)
          ..add('detail', detail)
          ..add('instance', instance)
          ..add('extensions', extensions))
        .toString();
  }
}

class $ProblemDetailsBuilder
    implements
        Builder<$ProblemDetails, $ProblemDetailsBuilder>,
        ProblemDetailsBuilder {
  _$$ProblemDetails? _$v;

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

  $ProblemDetailsBuilder() {
    $ProblemDetails._defaults(this);
  }

  $ProblemDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(covariant $ProblemDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$ProblemDetails;
  }

  @override
  void update(void Function($ProblemDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ProblemDetails build() => _build();

  _$$ProblemDetails _build() {
    _$$ProblemDetails _$result;
    try {
      _$result = _$v ??
          new _$$ProblemDetails._(
              type: type,
              title: title,
              status: status,
              detail: detail,
              instance: instance,
              extensions: extensions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        extensions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$ProblemDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
