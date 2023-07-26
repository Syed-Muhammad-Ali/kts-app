// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accouting_period_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccoutingPeriodDto extends AccoutingPeriodDto {
  @override
  final int id;
  @override
  final DateTime periodStartDate;
  @override
  final DateTime periodEndDate;

  factory _$AccoutingPeriodDto(
          [void Function(AccoutingPeriodDtoBuilder)? updates]) =>
      (new AccoutingPeriodDtoBuilder()..update(updates))._build();

  _$AccoutingPeriodDto._(
      {required this.id,
      required this.periodStartDate,
      required this.periodEndDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AccoutingPeriodDto', 'id');
    BuiltValueNullFieldError.checkNotNull(
        periodStartDate, r'AccoutingPeriodDto', 'periodStartDate');
    BuiltValueNullFieldError.checkNotNull(
        periodEndDate, r'AccoutingPeriodDto', 'periodEndDate');
  }

  @override
  AccoutingPeriodDto rebuild(
          void Function(AccoutingPeriodDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccoutingPeriodDtoBuilder toBuilder() =>
      new AccoutingPeriodDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccoutingPeriodDto &&
        id == other.id &&
        periodStartDate == other.periodStartDate &&
        periodEndDate == other.periodEndDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, periodStartDate.hashCode);
    _$hash = $jc(_$hash, periodEndDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccoutingPeriodDto')
          ..add('id', id)
          ..add('periodStartDate', periodStartDate)
          ..add('periodEndDate', periodEndDate))
        .toString();
  }
}

class AccoutingPeriodDtoBuilder
    implements Builder<AccoutingPeriodDto, AccoutingPeriodDtoBuilder> {
  _$AccoutingPeriodDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _periodStartDate;
  DateTime? get periodStartDate => _$this._periodStartDate;
  set periodStartDate(DateTime? periodStartDate) =>
      _$this._periodStartDate = periodStartDate;

  DateTime? _periodEndDate;
  DateTime? get periodEndDate => _$this._periodEndDate;
  set periodEndDate(DateTime? periodEndDate) =>
      _$this._periodEndDate = periodEndDate;

  AccoutingPeriodDtoBuilder() {
    AccoutingPeriodDto._defaults(this);
  }

  AccoutingPeriodDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _periodStartDate = $v.periodStartDate;
      _periodEndDate = $v.periodEndDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccoutingPeriodDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccoutingPeriodDto;
  }

  @override
  void update(void Function(AccoutingPeriodDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccoutingPeriodDto build() => _build();

  _$AccoutingPeriodDto _build() {
    final _$result = _$v ??
        new _$AccoutingPeriodDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AccoutingPeriodDto', 'id'),
            periodStartDate: BuiltValueNullFieldError.checkNotNull(
                periodStartDate, r'AccoutingPeriodDto', 'periodStartDate'),
            periodEndDate: BuiltValueNullFieldError.checkNotNull(
                periodEndDate, r'AccoutingPeriodDto', 'periodEndDate'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
