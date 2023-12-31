// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerDto extends CustomerDto {
  @override
  final int id;
  @override
  final String? name;
  @override
  final String? mobileNumber;
  @override
  final String? email;

  factory _$CustomerDto([void Function(CustomerDtoBuilder)? updates]) =>
      (new CustomerDtoBuilder()..update(updates))._build();

  _$CustomerDto._({required this.id, this.name, this.mobileNumber, this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CustomerDto', 'id');
  }

  @override
  CustomerDto rebuild(void Function(CustomerDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerDtoBuilder toBuilder() => new CustomerDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerDto &&
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
    return (newBuiltValueToStringHelper(r'CustomerDto')
          ..add('id', id)
          ..add('name', name)
          ..add('mobileNumber', mobileNumber)
          ..add('email', email))
        .toString();
  }
}

class CustomerDtoBuilder implements Builder<CustomerDto, CustomerDtoBuilder> {
  _$CustomerDto? _$v;

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

  CustomerDtoBuilder() {
    CustomerDto._defaults(this);
  }

  CustomerDtoBuilder get _$this {
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
  void replace(CustomerDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerDto;
  }

  @override
  void update(void Function(CustomerDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerDto build() => _build();

  _$CustomerDto _build() {
    final _$result = _$v ??
        new _$CustomerDto._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'CustomerDto', 'id'),
            name: name,
            mobileNumber: mobileNumber,
            email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
