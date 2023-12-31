// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_customers_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitCustomersResponse extends InitCustomersResponse {
  @override
  final BuiltList<CustomerDto>? customers;

  factory _$InitCustomersResponse(
          [void Function(InitCustomersResponseBuilder)? updates]) =>
      (new InitCustomersResponseBuilder()..update(updates))._build();

  _$InitCustomersResponse._({this.customers}) : super._();

  @override
  InitCustomersResponse rebuild(
          void Function(InitCustomersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitCustomersResponseBuilder toBuilder() =>
      new InitCustomersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitCustomersResponse && customers == other.customers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, customers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitCustomersResponse')
          ..add('customers', customers))
        .toString();
  }
}

class InitCustomersResponseBuilder
    implements Builder<InitCustomersResponse, InitCustomersResponseBuilder> {
  _$InitCustomersResponse? _$v;

  ListBuilder<CustomerDto>? _customers;
  ListBuilder<CustomerDto> get customers =>
      _$this._customers ??= new ListBuilder<CustomerDto>();
  set customers(ListBuilder<CustomerDto>? customers) =>
      _$this._customers = customers;

  InitCustomersResponseBuilder() {
    InitCustomersResponse._defaults(this);
  }

  InitCustomersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customers = $v.customers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitCustomersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitCustomersResponse;
  }

  @override
  void update(void Function(InitCustomersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitCustomersResponse build() => _build();

  _$InitCustomersResponse _build() {
    _$InitCustomersResponse _$result;
    try {
      _$result =
          _$v ?? new _$InitCustomersResponse._(customers: _customers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'customers';
        _customers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitCustomersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
