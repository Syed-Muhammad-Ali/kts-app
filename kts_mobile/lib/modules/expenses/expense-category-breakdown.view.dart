import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class ExpensesCategoryBreakdownView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final Stream<void> fabStream;
  final StreamController<void> showAdd;

  ExpensesCategoryBreakdownView(this.apiClient, this.fabStream, this.showAdd,
      {Key? key})
      : super(key: key) {
    this.showAdd.add(true);
  }

  @override
  State<ExpensesCategoryBreakdownView> createState() =>
      _ExpensesCategoryBreakdownViewState();
}

class _ExpensesCategoryBreakdownViewState
    extends State<ExpensesCategoryBreakdownView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");

  var expenseByCategory = List<ExpenseByCategoryItem>.empty();
  num? totalExpenses = null;
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();
  String? accoutingPeriodLabel;

  @override
  void initState() {
    super.initState();

    fabSubscription = widget.fabStream.listen((value) {
      context.goNamed(KtsRoutingLinks.create_expense_from_category);
    });

    EasyLoading.show(
      status: 'Loading expenses breakdown...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountReadApi()
        .accountReadInitAccountExpensesByCategory(cancelToken: cancelToken)
        .then((value) {
      if (value.data != null) {
        setState(() {
          expenseByCategory = (value.data!.expenseByCategories ??
                  List<ExpenseByCategoryItem>.empty())
              .map((e) => e)
              .toList();
          totalExpenses = expenseByCategory
              .map((e) => e.total)
              .reduce((value, element) => value + element);
          accoutingPeriodLabel =
              "${dateFormatter.format(value.data!.period!.periodStartDate.toLocal())} - ${dateFormatter.format(value.data!.period!.periodEndDate.toLocal())}";
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) => {EasyLoading.dismiss()});
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

  IconData getCategoryIcon(ExpenseCategoryDto? category) {
    if (category == null) {
      return Icons.question_mark;
    }
    switch (category.id) {
      case 1:
        return Icons.rate_review;
      case 2:
        return Icons.light;
      case 3:
        return Icons.business;
      case 4:
        return KtsCustomAppIcons.coffee_cup;
      case 5:
        return KtsCustomAppIcons.tools;
      case 6:
        return Icons.model_training;
      case 7:
        return Icons.phone;
      case 8:
        return KtsCustomAppIcons.edit;
      case 9:
        return Icons.subscriptions;
      case 10:
        return KtsCustomAppIcons.cc_visa;
      case 11:
        return KtsCustomAppIcons.instagram;
      case 12:
        return Icons.travel_explore;
      case 13:
        return KtsCustomAppIcons.female;
      case 14:
        return Icons.car_rental;
      case 15:
        return Icons.corporate_fare;
      case 16:
        return Icons.account_balance;
      case 17:
        return Icons.computer;
      case 18:
        return Icons.question_mark;
      case 19:
        return KtsCustomAppIcons.fill_drip;
      default:
        return Icons.question_mark;
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
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Expenses",
                        style: TextStyle(
                            color: ThemeColors.lightPink,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        accoutingPeriodLabel != null
                            ? "Your spending for the period $accoutingPeriodLabel"
                            : "",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 24),
                      child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => SweepGradient(colors: [
                                ThemeColors.darkPink,
                                ThemeColors.lightPink,
                              ], stops: [
                                0.5,
                                0.5
                              ]).createShader(
                                Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height),
                              ),
                          child: Text(
                            totalExpenses == null
                                ? ""
                                : "£${currencyFormatter.format(totalExpenses)}",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontSize: 50,
                                fontWeight: FontWeight.w800),
                          ))),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: expenseByCategory.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            onTap: (() => context.pushNamed(
                                    KtsRoutingLinks.expenses,
                                    params: {
                                      'categoryId': expenseByCategory[index]
                                          .category!
                                          .id
                                          .toString()
                                    })),
                            title: (Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: ThemeColors.darkGrey),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 16,
                                          right: 20,
                                          bottom: 16),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: 50,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                18)),
                                                    color:
                                                        ThemeColors.darkPink),
                                                child: Icon(
                                                  getCategoryIcon(
                                                      expenseByCategory[index]
                                                          .category),
                                                  color: ThemeColors.darkText,
                                                )),
                                            const SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  expenseByCategory[index]
                                                          .category!
                                                          .name ??
                                                      "-",
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    color: ThemeColors.darkPink,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                    "£${currencyFormatter.format(expenseByCategory[index].total)}",
                                                    style: const TextStyle(
                                                        color: ThemeColors
                                                            .darkPink,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            )
                                          ])),
                                ))));
                      }),
                ],
              ))
        ])),
      ],
    );
  }
}
