// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountDto extends AccountDto {
  @override
  final String? nationalInsuranceNumber;
  @override
  final String? name;
  @override
  final AddressDto? address;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? utr;
  @override
  final num? annualEmploymentIncome;
  @override
  final SubscriptionType subscriptionType;
  @override
  final BkUserDto? user;
  @override
  final String? appStoreUserId;
  @override
  final bool isTestAccount;

  factory _$AccountDto([void Function(AccountDtoBuilder)? updates]) =>
      (new AccountDtoBuilder()..update(updates))._build();

  _$AccountDto._(
      {this.nationalInsuranceNumber,
      this.name,
      this.address,
      this.dateOfBirth,
      this.utr,
      this.annualEmploymentIncome,
      required this.subscriptionType,
      this.user,
      this.appStoreUserId,
      required this.isTestAccount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        subscriptionType, r'AccountDto', 'subscriptionType');
    BuiltValueNullFieldError.checkNotNull(
        isTestAccount, r'AccountDto', 'isTestAccount');
  }

  @override
  AccountDto rebuild(void Function(AccountDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountDtoBuilder toBuilder() => new AccountDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountDto &&
        nationalInsuranceNumber == other.nationalInsuranceNumber &&
        name == other.name &&
        address == other.address &&
        dateOfBirth == other.dateOfBirth &&
        utr == other.utr &&
        annualEmploymentIncome == other.annualEmploymentIncome &&
        subscriptionType == other.subscriptionType &&
        user == other.user &&
        appStoreUserId == other.appStoreUserId &&
        isTestAccount == other.isTestAccount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nationalInsuranceNumber.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, utr.hashCode);
    _$hash = $jc(_$hash, annualEmploymentIncome.hashCode);
    _$hash = $jc(_$hash, subscriptionType.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, appStoreUserId.hashCode);
    _$hash = $jc(_$hash, isTestAccount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountDto')
          ..add('nationalInsuranceNumber', nationalInsuranceNumber)
          ..add('name', name)
          ..add('address', address)
          ..add('dateOfBirth', dateOfBirth)
          ..add('utr', utr)
          ..add('annualEmploymentIncome', annualEmploymentIncome)
          ..add('subscriptionType', subscriptionType)
          ..add('user', user)
          ..add('appStoreUserId', appStoreUserId)
          ..add('isTestAccount', isTestAccount))
        .toString();
  }
}

class AccountDtoBuilder implements Builder<AccountDto, AccountDtoBuilder> {
  _$AccountDto? _$v;

  String? _nationalInsuranceNumber;
  String? get nationalInsuranceNumber => _$this._nationalInsuranceNumber;
  set nationalInsuranceNumber(String? nationalInsuranceNumber) =>
      _$this._nationalInsuranceNumber = nationalInsuranceNumber;

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

  BkUserDtoBuilder? _user;
  BkUserDtoBuilder get user => _$this._user ??= new BkUserDtoBuilder();
  set user(BkUserDtoBuilder? user) => _$this._user = user;

  String? _appStoreUserId;
  String? get appStoreUserId => _$this._appStoreUserId;
  set appStoreUserId(String? appStoreUserId) =>
      _$this._appStoreUserId = appStoreUserId;

  bool? _isTestAccount;
  bool? get isTestAccount => _$this._isTestAccount;
  set isTestAccount(bool? isTestAccount) =>
      _$this._isTestAccount = isTestAccount;

  AccountDtoBuilder() {
    AccountDto._defaults(this);
  }

  AccountDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nationalInsuranceNumber = $v.nationalInsuranceNumber;
      _name = $v.name;
      _address = $v.address?.toBuilder();
      _dateOfBirth = $v.dateOfBirth;
      _utr = $v.utr;
      _annualEmploymentIncome = $v.annualEmploymentIncome;
      _subscriptionType = $v.subscriptionType;
      _user = $v.user?.toBuilder();
      _appStoreUserId = $v.appStoreUserId;
      _isTestAccount = $v.isTestAccount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountDto;
  }

  @override
  void update(void Function(AccountDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountDto build() => _build();

  _$AccountDto _build() {
    _$AccountDto _$result;
    try {
      _$result = _$v ??
          new _$AccountDto._(
              nationalInsuranceNumber: nationalInsuranceNumber,
              name: name,
              address: _address?.build(),
              dateOfBirth: dateOfBirth,
              utr: utr,
              annualEmploymentIncome: annualEmploymentIncome,
              subscriptionType: BuiltValueNullFieldError.checkNotNull(
                  subscriptionType, r'AccountDto', 'subscriptionType'),
              user: _user?.build(),
              appStoreUserId: appStoreUserId,
              isTestAccount: BuiltValueNullFieldError.checkNotNull(
                  isTestAccount, r'AccountDto', 'isTestAccount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AccountDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
