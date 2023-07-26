// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCustomerRequest extends CreateCustomerRequest {
  @override
  final String? name;
  @override
  final String? mobileNumber;
  @override
  final String? email;

  factory _$CreateCustomerRequest(
          [void Function(CreateCustomerRequestBuilder)? updates]) =>
      (new CreateCustomerRequestBuilder()..update(updates))._build();

  _$CreateCustomerRequest._({this.name, this.mobileNumber, this.email})
      : super._();

  @override
  CreateCustomerRequest rebuild(
          void Function(CreateCustomerRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCustomerRequestBuilder toBuilder() =>
      new CreateCustomerRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCustomerRequest &&
        name == other.name &&
        mobileNumber == other.mobileNumber &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, mobileNumber.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCustomerRequest')
          ..add('name', name)
          ..add('mobileNumber', mobileNumber)
          ..add('email', email))
        .toString();
  }
}

class CreateCustomerRequestBuilder
    implements Builder<CreateCustomerRequest, CreateCustomerRequestBuilder> {
  _$CreateCustomerRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  CreateCustomerRequestBuilder() {
    CreateCustomerRequest._defaults(this);
  }

  CreateCustomerRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _mobileNumber = $v.mobileNumber;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCustomerRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateCustomerRequest;
  }

  @override
  void update(void Function(CreateCustomerRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCustomerRequest build() => _build();

  _$CreateCustomerRequest _build() {
    final _$result = _$v ??
        new _$CreateCustomerRequest._(
            name: name, mobileNumber: mobileNumber, email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
