import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';

class SummariesView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final StreamController<void> showAdd;

  SummariesView(this.apiClient, this.showAdd, {Key? key}) : super(key: key) {
    this.showAdd.add(false);
  }

  @override
  State<SummariesView> createState() => _SummariesViewState();
}

class _SummariesViewState extends State<SummariesView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");

  var expenses = List<ExpenseDto>.empty();
  num? taxLiability = 0;
  num? total_yearly_expenses = 0;
  num? total_yearly_revenues = 0;
  num? total_monthly_expenses = 0;
  num? total_monthly_revenues = 0;
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();
  //String? accoutingPeriodLabel;
  //_IncomesViewState() {}
  @override
  void initState() {
    super.initState();

    EasyLoading.show(
      status: 'Loading Summary...',
      maskType: EasyLoadingMaskType.black,
    );

    DateTime now = DateTime.now();
    var startDate = DateFormat('yyyy-MM-dd').format(now);
    var endDate = DateFormat('yyyy-MM-dd').format(now);

    // Convert formatted strings to DateTime objects
    DateTime parsedStartDate = DateFormat('yyyy-MM-dd').parse(startDate);
    DateTime parsedEndDate = DateFormat('yyyy-MM-dd').parse(endDate);

    print("parsedStartDate : $parsedStartDate");
    print("parsedEndDate : $parsedEndDate");
    widget.apiClient
        .getAccountReadApi()
        .accountReadSummary(
          start_date: parsedStartDate.toUtc(),
          end_date: parsedEndDate.toUtc(),
          cancelToken: cancelToken,
        )
        .then(
      (value) {
        if (value.data != null) {
          setState(() {
            expenses = (value.data!.expenses ?? List<ExpenseDto>.empty())
                .map((e) => e)
                .toList();
            taxLiability = value.data!.taxLiability;
            total_yearly_expenses = value.data!.total_yearly_expenses;
            total_yearly_revenues = value.data!.total_yearly_revenues;
            total_monthly_expenses = value.data!.total_monthly_expenses;
            total_monthly_revenues = value.data!.total_monthly_revenues;
          });
        }
        EasyLoading.dismiss();
      },
      onError: (err) => {EasyLoading.dismiss()},
    );
  }

  @override
  Future dispose() async {
    super.dispose();
    if (fabSubscription != null) {
      await fabSubscription!.cancel();
    }
    if (cancelToken != null) {
      cancelToken!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/kts-background.png"),
                  fit: BoxFit.cover,
                )))),
        SafeArea(
            child: ListView(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 0),
                          child: Text(
                            "Summaries",
                            style: TextStyle(
                                color: ThemeColors.lightPink,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        width: 100,
                        height: 20,
                        decoration: const BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: ThemeColors.darkPink),
                        child: Center(
                          child: Text("Export Summary",
                              style: const TextStyle(
                                  color: ThemeColors.darkText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: ThemeColors.darkGrey),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tax Liability",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: ThemeColors.light,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          taxLiability == null
                                              ? ""
                                              : "£${currencyFormatter.format(taxLiability)}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ThemeColors.darkPink,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  )
                                ])),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: ThemeColors.darkGrey),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Income for Year",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: ThemeColors.light,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          total_yearly_revenues == null
                                              ? ""
                                              : "£${currencyFormatter.format(total_yearly_revenues)}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ThemeColors.darkPink,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  )
                                ])),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: ThemeColors.darkGrey),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Income for Month",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: ThemeColors.light,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          total_monthly_revenues == null
                                              ? ""
                                              : "£${currencyFormatter.format(total_monthly_revenues)}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ThemeColors.darkPink,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  )
                                ])),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: ThemeColors.darkGrey),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expenses for Year",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: ThemeColors.light,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          total_yearly_expenses == null
                                              ? ""
                                              : "£${currencyFormatter.format(total_yearly_expenses)}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ThemeColors.darkPink,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  )
                                ])),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: ThemeColors.darkGrey),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expenses for Month",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: ThemeColors.light,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          total_monthly_expenses == null
                                              ? ""
                                              : "£${currencyFormatter.format(total_monthly_expenses)}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ThemeColors.darkPink,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  )
                                ])),
                      )),
                ],
              ))
        ])),
      ],
    );
  }
}
