// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressDto extends AddressDto {
  @override
  final String? addressLine1;
  @override
  final String? addressLine2;
  @override
  final String? postcode;
  @override
  final String? town;
  @override
  final String? county;
  @override
  final Country country;

  factory _$AddressDto([void Function(AddressDtoBuilder)? updates]) =>
      (new AddressDtoBuilder()..update(updates))._build();

  _$AddressDto._(
      {this.addressLine1,
      this.addressLine2,
      this.postcode,
      this.town,
      this.county,
      required this.country})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(country, r'AddressDto', 'country');
  }

  @override
  AddressDto rebuild(void Function(AddressDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressDtoBuilder toBuilder() => new AddressDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressDto &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        postcode == other.postcode &&
        town == other.town &&
        county == other.county &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, addressLine1.hashCode);
    _$hash = $jc(_$hash, addressLine2.hashCode);
    _$hash = $jc(_$hash, postcode.hashCode);
    _$hash = $jc(_$hash, town.hashCode);
    _$hash = $jc(_$hash, county.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressDto')
          ..add('addressLine1', addressLine1)
          ..add('addressLine2', addressLine2)
          ..add('postcode', postcode)
          ..add('town', town)
          ..add('county', county)
          ..add('country', country))
        .toString();
  }
}

class AddressDtoBuilder implements Builder<AddressDto, AddressDtoBuilder> {
  _$AddressDto? _$v;

  String? _addressLine1;
  String? get addressLine1 => _$this._addressLine1;
  set addressLine1(String? addressLine1) => _$this._addressLine1 = addressLine1;

  String? _addressLine2;
  String? get addressLine2 => _$this._addressLine2;
  set addressLine2(String? addressLine2) => _$this._addressLine2 = addressLine2;

  String? _postcode;
  String? get postcode => _$this._postcode;
  set postcode(String? postcode) => _$this._postcode = postcode;

  String? _town;
  String? get town => _$this._town;
  set town(String? town) => _$this._town = town;

  String? _county;
  String? get county => _$this._county;
  set county(String? county) => _$this._county = county;

  Country? _country;
  Country? get country => _$this._country;
  set country(Country? country) => _$this._country = country;

  AddressDtoBuilder() {
    AddressDto._defaults(this);
  }

  AddressDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressLine1 = $v.addressLine1;
      _addressLine2 = $v.addressLine2;
      _postcode = $v.postcode;
      _town = $v.town;
      _county = $v.county;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressDto;
  }

  @override
  void update(void Function(AddressDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressDto build() => _build();

  _$AddressDto _build() {
    final _$result = _$v ??
        new _$AddressDto._(
            addressLine1: addressLine1,
            addressLine2: addressLine2,
            postcode: postcode,
            town: town,
            county: county,
            country: BuiltValueNullFieldError.checkNotNull(
                country, r'AddressDto', 'country'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
