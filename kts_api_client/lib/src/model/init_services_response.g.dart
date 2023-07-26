// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_services_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitServicesResponse extends InitServicesResponse {
  @override
  final BuiltList<ServiceDto>? services;

  factory _$InitServicesResponse(
          [void Function(InitServicesResponseBuilder)? updates]) =>
      (new InitServicesResponseBuilder()..update(updates))._build();

  _$InitServicesResponse._({this.services}) : super._();

  @override
  InitServicesResponse rebuild(
          void Function(InitServicesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitServicesResponseBuilder toBuilder() =>
      new InitServicesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitServicesResponse && services == other.services;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitServicesResponse')
          ..add('services', services))
        .toString();
  }
}

class InitServicesResponseBuilder
    implements Builder<InitServicesResponse, InitServicesResponseBuilder> {
  _$InitServicesResponse? _$v;

  ListBuilder<ServiceDto>? _services;
  ListBuilder<ServiceDto> get services =>
      _$this._services ??= new ListBuilder<ServiceDto>();
  set services(ListBuilder<ServiceDto>? services) =>
      _$this._services = services;

  InitServicesResponseBuilder() {
    InitServicesResponse._defaults(this);
  }

  InitServicesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _services = $v.services?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitServicesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitServicesResponse;
  }

  @override
  void update(void Function(InitServicesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitServicesResponse build() => _build();

  _$InitServicesResponse _build() {
    _$InitServicesResponse _$result;
    try {
      _$result =
          _$v ?? new _$InitServicesResponse._(services: _services?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        _services?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitServicesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
