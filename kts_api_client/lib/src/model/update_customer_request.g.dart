// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCustomerRequest extends UpdateCustomerRequest {
  @override
  final int id;
  @override
  final String? name;
  @override
  final String? mobileNumber;
  @override
  final String? email;

  factory _$UpdateCustomerRequest(
          [void Function(UpdateCustomerRequestBuilder)? updates]) =>
      (new UpdateCustomerRequestBuilder()..update(updates))._build();

  _$UpdateCustomerRequest._(
      {required this.id, this.name, this.mobileNumber, this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateCustomerRequest', 'id');
  }

  @override
  UpdateCustomerRequest rebuild(
          void Function(UpdateCustomerRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCustomerRequestBuilder toBuilder() =>
      new UpdateCustomerRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCustomerRequest &&
        id == other.id &&
        name == other.name &&
        mobileNumber == other.mobileNumber &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, mobileNumber.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCustomerRequest')
          ..add('id', id)
          ..add('name', name)
          ..add('mobileNumber', mobileNumber)
          ..add('email', email))
        .toString();
  }
}

class UpdateCustomerRequestBuilder
    implements Builder<UpdateCustomerRequest, UpdateCustomerRequestBuilder> {
  _$UpdateCustomerRequest? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UpdateCustomerRequestBuilder() {
    UpdateCustomerRequest._defaults(this);
  }

  UpdateCustomerRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _mobileNumber = $v.mobileNumber;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCustomerRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCustomerRequest;
  }

  @override
  void update(void Function(UpdateCustomerRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCustomerRequest build() => _build();

  _$UpdateCustomerRequest _build() {
    final _$result = _$v ??
        new _$UpdateCustomerRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateCustomerRequest', 'id'),
            name: name,
            mobileNumber: mobileNumber,
            email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
