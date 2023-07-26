// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAccountRequest extends UpdateAccountRequest {
  @override
  final String? email;
  @override
  final String? nino;
  @override
  final String? name;
  @override
  final AddressDto? address;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? utr;
  @override
  final num annualEmploymentIncome;

  factory _$UpdateAccountRequest(
          [void Function(UpdateAccountRequestBuilder)? updates]) =>
      (new UpdateAccountRequestBuilder()..update(updates))._build();

  _$UpdateAccountRequest._(
      {this.email,
      this.nino,
      this.name,
      this.address,
      this.dateOfBirth,
      this.utr,
      required this.annualEmploymentIncome})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(annualEmploymentIncome,
        r'UpdateAccountRequest', 'annualEmploymentIncome');
  }

  @override
  UpdateAccountRequest rebuild(
          void Function(UpdateAccountRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAccountRequestBuilder toBuilder() =>
      new UpdateAccountRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAccountRequest &&
        email == other.email &&
        nino == other.nino &&
        name == other.name &&
        address == other.address &&
        dateOfBirth == other.dateOfBirth &&
        utr == other.utr &&
        annualEmploymentIncome == other.annualEmploymentIncome;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, nino.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, utr.hashCode);
    _$hash = $jc(_$hash, annualEmploymentIncome.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateAccountRequest')
          ..add('email', email)
          ..add('nino', nino)
          ..add('name', name)
          ..add('address', address)
          ..add('dateOfBirth', dateOfBirth)
          ..add('utr', utr)
          ..add('annualEmploymentIncome', annualEmploymentIncome))
        .toString();
  }
}

class UpdateAccountRequestBuilder
    implements Builder<UpdateAccountRequest, UpdateAccountRequestBuilder> {
  _$UpdateAccountRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _nino;
  String? get nino => _$this._nino;
  set nino(String? nino) => _$this._nino = nino;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AddressDtoBuilder? _address;
  AddressDtoBuilder get address => _$this._address ??= new AddressDtoBuilder();
  set address(AddressDtoBuilder? address) => _$this._address = address;

  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(DateTime? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  String? _utr;
  String? get utr => _$this._utr;
  set utr(String? utr) => _$this._utr = utr;

  num? _annualEmploymentIncome;
  num? get annualEmploymentIncome => _$this._annualEmploymentIncome;
  set annualEmploymentIncome(num? annualEmploymentIncome) =>
      _$this._annualEmploymentIncome = annualEmploymentIncome;

  UpdateAccountRequestBuilder() {
    UpdateAccountRequest._defaults(this);
  }

  UpdateAccountRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _nino = $v.nino;
      _name = $v.name;
      _address = $v.address?.toBuilder();
      _dateOfBirth = $v.dateOfBirth;
      _utr = $v.utr;
      _annualEmploymentIncome = $v.annualEmploymentIncome;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAccountRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAccountRequest;
  }

  @override
  void update(void Function(UpdateAccountRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAccountRequest build() => _build();

  _$UpdateAccountRequest _build() {
    _$UpdateAccountRequest _$result;
    try {
      _$result = _$v ??
          new _$UpdateAccountRequest._(
              email: email,
              nino: nino,
              name: name,
              address: _address?.build(),
              dateOfBirth: dateOfBirth,
              utr: utr,
              annualEmploymentIncome: BuiltValueNullFieldError.checkNotNull(
                  annualEmploymentIncome,
                  r'UpdateAccountRequest',
                  'annualEmploymentIncome'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateAccountRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
