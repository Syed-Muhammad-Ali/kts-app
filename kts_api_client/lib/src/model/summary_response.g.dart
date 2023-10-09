// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SummaryResponse extends SummaryResponse {
  @override
  final BuiltList<ExpenseDto>? expenses;
  
  //  @override
  // final BuiltList<IncomeDto>? revenue;

   @override
  final num taxLiability;

   @override
  final num total_yearly_expenses;

   @override
  final num total_yearly_revenues;

   @override
  final num total_monthly_expenses;

   @override
  final num total_monthly_revenues;


  factory _$SummaryResponse(
          [void Function(SummaryResponseBuilder)? updates]) =>
      (new SummaryResponseBuilder()..update(updates))._build();

  _$SummaryResponse._(
      {this.expenses, required this.taxLiability, required this.total_yearly_expenses, required this.total_yearly_revenues,required this.total_monthly_expenses,required this.total_monthly_revenues, })
      : super._() {
       BuiltValueNullFieldError.checkNotNull(
        taxLiability, r'SummaryResponse', 'taxLiability');
       BuiltValueNullFieldError.checkNotNull(
        total_yearly_expenses, r'SummaryResponse', 'total_yearly_expenses');
       BuiltValueNullFieldError.checkNotNull(
        total_yearly_revenues, r'SummaryResponse', 'total_yearly_revenues');   
       BuiltValueNullFieldError.checkNotNull(
        total_monthly_expenses, r'SummaryResponse', 'total_monthly_expenses');   
       BuiltValueNullFieldError.checkNotNull(
        total_monthly_revenues, r'SummaryResponse', 'total_monthly_revenues');   
      }

  @override
  SummaryResponse rebuild(
          void Function(SummaryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummaryResponseBuilder toBuilder() =>
      new SummaryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummaryResponse &&
        expenses == other.expenses &&
        // revenue == other.revenue &&
        taxLiability == other.taxLiability &&
        total_yearly_expenses == other.total_yearly_expenses &&
        total_yearly_revenues == other.total_yearly_revenues &&
        total_monthly_expenses == other.total_monthly_expenses &&
        total_monthly_revenues == other.total_monthly_revenues;
    
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expenses.hashCode);
    // _$hash = $jc(_$hash, revenue.hashCode);
    _$hash = $jc(_$hash, taxLiability.hashCode);
    _$hash = $jc(_$hash, total_yearly_expenses.hashCode);
    _$hash = $jc(_$hash, total_yearly_revenues.hashCode);
    _$hash = $jc(_$hash, total_monthly_expenses.hashCode);
    _$hash = $jc(_$hash, total_monthly_revenues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SummaryResponse')
          ..add('expenses', expenses)
          // ..add('revenue', revenue)
          ..add('taxLiability', taxLiability)
          ..add('total_yearly_expenses', total_yearly_expenses)
          ..add('total_yearly_revenues', total_yearly_revenues)
          ..add('total_monthly_expenses', total_monthly_expenses)
          ..add('total_monthly_revenues', total_monthly_revenues)
     
          )
        .toString();
  }
}

class SummaryResponseBuilder
    implements
        Builder<SummaryResponse, SummaryResponseBuilder> {
  _$SummaryResponse? _$v;

 
   ListBuilder<ExpenseDto>? _expenses;
  ListBuilder<ExpenseDto> get expenses =>
      _$this._expenses??= new ListBuilder<ExpenseDto>();
  set expenses(ListBuilder<ExpenseDto>? expenses) =>
      _$this._expenses = expenses;

  //  ListBuilder<IncomeDto>? _revenue;
  // ListBuilder<IncomeDto> get revenue =>
  //     _$this._revenue??= new ListBuilder<IncomeDto>();
  // set revenue(ListBuilder<IncomeDto>? revenue) =>
  //     _$this._revenue = revenue;

   
   num? _taxLiability;
  num? get taxLiability => _$this._taxLiability;
  set taxLiability(num? taxLiability) =>
      _$this._taxLiability = taxLiability;
      
   num? _total_yearly_expenses;
  num? get total_yearly_expenses => _$this._total_yearly_expenses;
  set total_yearly_expenses(num? total_yearly_expenses) =>
      _$this._total_yearly_expenses = total_yearly_expenses;

   num? _total_yearly_revenues;
  num? get total_yearly_revenues => _$this._total_yearly_revenues;
  set total_yearly_revenues(num? total_yearly_revenues) =>
      _$this._total_yearly_revenues = total_yearly_revenues;   

   num? _total_monthly_expenses;
  num? get total_monthly_expenses => _$this._total_monthly_expenses;
  set total_monthly_expenses(num? total_monthly_expenses) =>
      _$this._total_monthly_expenses = total_monthly_expenses;    

   num? _total_monthly_revenues;
  num? get total_monthly_revenues => _$this._total_monthly_revenues;
  set total_monthly_revenues(num? total_monthly_revenues) =>
      _$this._total_monthly_revenues = total_monthly_revenues;    

  SummaryResponseBuilder() {
    SummaryResponse._defaults(this);
  }

  SummaryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expenses= $v.expenses?.toBuilder();
      // _revenue= $v.revenue?.toBuilder();
      _taxLiability = $v.taxLiability;
      _total_yearly_expenses = $v.total_yearly_expenses;
      _total_yearly_revenues = $v.total_yearly_revenues;
      _total_monthly_expenses = $v.total_monthly_expenses;
      _total_monthly_revenues = $v.total_monthly_revenues;
    
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummaryResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SummaryResponse;
  }

  @override
  void update(void Function(SummaryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SummaryResponse build() => _build();

  _$SummaryResponse _build() {
    _$SummaryResponse _$result;
    try {
      _$result = _$v ??
          new _$SummaryResponse._(
              expenses: _expenses?.build(),
              // revenue: _revenue?.build(),
              
                 taxLiability: BuiltValueNullFieldError.checkNotNull(
                  taxLiability,
                  r'SummaryResponse',
                  'taxLiability'),

                 total_yearly_expenses: BuiltValueNullFieldError.checkNotNull(
                  total_yearly_expenses,
                  r'SummaryResponse',
                  'total_yearly_expenses'),

                 total_yearly_revenues: BuiltValueNullFieldError.checkNotNull(
                  total_yearly_revenues,
                  r'SummaryResponse',
                  'total_yearly_revenues'),

                 total_monthly_expenses: BuiltValueNullFieldError.checkNotNull(
                  total_monthly_expenses,
                  r'SummaryResponse',
                  'total_monthly_expenses'),

                 total_monthly_revenues: BuiltValueNullFieldError.checkNotNull(
                  total_monthly_revenues,
                  r'SummaryResponse',
                  'total_monthly_revenues')
              );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expenses';
        _expenses?.build();
   
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SummaryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
