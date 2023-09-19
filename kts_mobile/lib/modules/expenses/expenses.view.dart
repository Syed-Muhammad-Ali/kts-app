// ignore_for_file: dead_code, unused_element

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpensesView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final Stream<void> fabStream;
  final StreamController<void> showAdd;
  final int categoryId;

  ExpensesView(this.apiClient, this.fabStream, this.showAdd, this.categoryId,
      {Key? key})
      : super(key: key) {
    this.showAdd.add(true);
  }

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");

  var expenses = List<ExpenseDto>.empty();
  num? totalExpenses = null;
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();
  ExpenseCategoryDto? category;

  _ExpensesViewState() {}

  @override
  void initState() {
    super.initState();

    fabSubscription = widget.fabStream.listen((value) {
      context.goNamed(KtsRoutingLinks.create_expense, params: {
        'categoryId': widget.categoryId.toString(),
      });
    });

    EasyLoading.show(
      status: 'Loading expenses...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountReadApi()
        .accountReadInitAccountExpensesForCategory(
            categoryId: widget.categoryId)
        .then((value) {
      if (value.data != null) {
        setState(() {
          expenses = (value.data!.expenses ?? List<ExpenseDto>.empty())
              .map((e) => e)
              .toList();
          category = value.data!.category;
          totalExpenses = value.data!.totalExpenseSum;
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
        return Icons.cleaning_services;
      case 5:
        return Icons.home_repair_service;
      case 6:
        return Icons.model_training;
      case 7:
        return Icons.phone;
      case 8:
        return Icons.post_add;
      case 9:
        return Icons.subscriptions;
      case 10:
        return Icons.money;
      case 11:
        return Icons.watch;
      case 12:
        return Icons.travel_explore;
      case 13:
        return Icons.work;
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
      default:
        return Icons.question_mark;
    }
  }

  String _getCategoryText() {
    return "coming soon";
    if (category == null) {
      return "-";
    }
    switch (category!.id) {
      case 1:
        return "Rent & Rates – ‘This is either premises rent and rates or chair rent. You cannot claim your own home rent and rates. If you use your home as your working place, please visit here for more information on what you can claim’. https://www.gov.uk/simpler-income-tax-simplified-expenses/working-from-home.";
      case 2:
        return "";
      case 3:
        return "";
      case 4:
        return "";
      case 5:
        return "";
      case 6:
        return "";
      case 7:
        return "";
      case 8:
        return "";
      case 9:
        return "";
      case 10:
        return "";
      case 11:
        return "";
      case 12:
        return "";
      case 13:
        return "";
      case 14:
        return "";
      case 15:
        return "";
      case 16:
        return "";
      case 17:
        return "";
      case 18:
        return "";
      default:
        return "";
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 30,
                            height: 28,
                            child: IconButton(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(0),
                              splashColor: ThemeColors.lightPink,
                              splashRadius: 5,
                              icon: Icon(Icons.arrow_back, size: 28),
                              color: ThemeColors.darkPink,
                              onPressed: () => GoRouter.of(context).pushNamed(
                                  KtsRoutingLinks.expenses_breakdown),
                            )),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 0),
                                child: Text(
                                  category != null ? category!.name ?? "" : "",
                                  style: TextStyle(
                                      color: ThemeColors.lightPink,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                  softWrap: true,
                                )))
                      ]),
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: category != null
                        ? RichText(
                            text: TextSpan(children: [
                            TextSpan(
                                text: category!.helpText ?? "",
                                style: TextStyle(
                                    color: ThemeColors.light,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                            category!.helpUrl != null
                                ? TextSpan(text: "\n\n")
                                : TextSpan(),
                            TextSpan(
                              text: category!.helpUrl ?? "",
                              style: new TextStyle(color: ThemeColors.darkPink),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse(category!.helpUrl ?? ""));
                                },
                            )
                          ]))
                        : SizedBox(),
                  ),
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
                      itemCount: expenses.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            onTap: (() => context.goNamed(
                                    KtsRoutingLinks.edit_expense,
                                    params: {
                                      'categoryId':
                                          widget.categoryId.toString(),
                                      'id': expenses[index].id.toString()
                                    })),
                            title: (
                              Padding(
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
                                                child: Icon(getCategoryIcon(
                                                    expenses[index].category))),
                                            const SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  expenses[index].supplier ??
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
                                                Text(
                                                    expenses[index].notes ?? "",
                                                    style: const TextStyle(
                                                        color:
                                                            ThemeColors.light,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        overflow: TextOverflow
                                                            .ellipsis))
                                              ],
                                            )),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "£${currencyFormatter.format(expenses[index].amount)}",
                                                    style: const TextStyle(
                                                        color: ThemeColors
                                                            .darkPink,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                Text(
                                                    dateFormatter.format(
                                                        expenses[index]
                                                            .paidDateTime
                                                            .toLocal()),
                                                    style: const TextStyle(
                                                        color:
                                                            ThemeColors.light,
                                                        fontWeight:
                                                            FontWeight.w300))
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
