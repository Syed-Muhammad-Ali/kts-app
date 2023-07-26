// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignupRequest extends SignupRequest {
  @override
  final String? nino;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? name;
  @override
  final AddressDto? address;
  @override
  final DateTime dateOfBirth;
  @override
  final String? utr;
  @override
  final num annualEmploymentIncome;
  @override
  final SubscriptionType? subscriptionType;
  @override
  final String? appStoreId;

  factory _$SignupRequest([void Function(SignupRequestBuilder)? updates]) =>
      (new SignupRequestBuilder()..update(updates))._build();

  _$SignupRequest._(
      {this.nino,
      this.email,
      this.password,
      this.name,
      this.address,
      required this.dateOfBirth,
      this.utr,
      required this.annualEmploymentIncome,
      this.subscriptionType,
      this.appStoreId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dateOfBirth, r'SignupRequest', 'dateOfBirth');
    BuiltValueNullFieldError.checkNotNull(
        annualEmploymentIncome, r'SignupRequest', 'annualEmploymentIncome');
  }

  @override
  SignupRequest rebuild(void Function(SignupRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignupRequestBuilder toBuilder() => new SignupRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignupRequest &&
        nino == other.nino &&
        email == other.email &&
        password == other.password &&
        name == other.name &&
        address == other.address &&
        dateOfBirth == other.dateOfBirth &&
        utr == other.utr &&
        annualEmploymentIncome == other.annualEmploymentIncome &&
        subscriptionType == other.subscriptionType &&
        appStoreId == other.appStoreId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nino.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, utr.hashCode);
    _$hash = $jc(_$hash, annualEmploymentIncome.hashCode);
    _$hash = $jc(_$hash, subscriptionType.hashCode);
    _$hash = $jc(_$hash, appStoreId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignupRequest')
          ..add('nino', nino)
          ..add('email', email)
          ..add('password', password)
          ..add('name', name)
          ..add('address', address)
          ..add('dateOfBirth', dateOfBirth)
          ..add('utr', utr)
          ..add('annualEmploymentIncome', annualEmploymentIncome)
          ..add('subscriptionType', subscriptionType)
          ..add('appStoreId', appStoreId))
        .toString();
  }
}

class SignupRequestBuilder
    implements Builder<SignupRequest, SignupRequestBuilder> {
  _$SignupRequest? _$v;

  String? _nino;
  String? get nino => _$this._nino;
  set nino(String? nino) => _$this._nino = nino;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

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

  SubscriptionType? _subscriptionType;
  SubscriptionType? get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType? subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  String? _appStoreId;
  String? get appStoreId => _$this._appStoreId;
  set appStoreId(String? appStoreId) => _$this._appStoreId = appStoreId;

  SignupRequestBuilder() {
    SignupRequest._defaults(this);
  }

  SignupRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nino = $v.nino;
      _email = $v.email;
      _password = $v.password;
      _name = $v.name;
      _address = $v.address?.toBuilder();
      _dateOfBirth = $v.dateOfBirth;
      _utr = $v.utr;
      _annualEmploymentIncome = $v.annualEmploymentIncome;
      _subscriptionType = $v.subscriptionType;
      _appStoreId = $v.appStoreId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignupRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignupRequest;
  }

  @override
  void update(void Function(SignupRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignupRequest build() => _build();

  _$SignupRequest _build() {
    _$SignupRequest _$result;
    try {
      _$result = _$v ??
          new _$SignupRequest._(
              nino: nino,
              email: email,
              password: password,
              name: name,
              address: _address?.build(),
              dateOfBirth: BuiltValueNullFieldError.checkNotNull(
                  dateOfBirth, r'SignupRequest', 'dateOfBirth'),
              utr: utr,
              annualEmploymentIncome: BuiltValueNullFieldError.checkNotNull(
                  annualEmploymentIncome,
                  r'SignupRequest',
                  'annualEmploymentIncome'),
              subscriptionType: subscriptionType,
              appStoreId: appStoreId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SignupRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
