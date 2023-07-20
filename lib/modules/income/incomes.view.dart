import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

class IncomesView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final Stream<void> fabStream;
  final StreamController<void> showAdd;

  IncomesView(this.apiClient, this.fabStream, this.showAdd, {Key? key})
      : super(key: key) {
    this.showAdd.add(true);
  }

  @override
  State<IncomesView> createState() => _IncomesViewState();
}

class _IncomesViewState extends State<IncomesView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");

  var income = List<IncomeDto>.empty();
  num? totalIncome = 0;
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();
  String? accoutingPeriodLabel;
  _IncomesViewState() {}

  @override
  void initState() {
    super.initState();

    fabSubscription = widget.fabStream.listen((value) {
      context.goNamed(KtsRoutingLinks.create_income);
    });

    EasyLoading.show(
      status: 'Loading income...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient.getAccountReadApi().accountReadInitAccountIncomes().then(
        (value) {
      if (value.data != null) {
        setState(() {
          income = (value.data!.income ?? List<IncomeDto>.empty())
              .map((e) => e)
              .toList();
          totalIncome = value.data!.totalIncomeSum;
          accoutingPeriodLabel =
              "${dateFormatter.format(value.data!.accountingPeriod!.periodStartDate.toLocal())} to ${dateFormatter.format(value.data!.accountingPeriod!.periodEndDate.toLocal())}";
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
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        "Income",
                        style: TextStyle(
                            color: ThemeColors.lightPink,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        accoutingPeriodLabel != null
                            ? "A look at current income for period $accoutingPeriodLabel"
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
                            totalIncome == null
                                ? ""
                                : "£${currencyFormatter.format(totalIncome)}",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontSize: 50,
                                fontWeight: FontWeight.w800),
                          ))),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: income.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            onTap: (() => context.goNamed(
                                KtsRoutingLinks.edit_income,
                                params: {'id': income[index].id.toString()})),
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
                                            const SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  income[index].description ??
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
                                                    "£${currencyFormatter.format(income[index].amount)}",
                                                    style: const TextStyle(
                                                        color: ThemeColors
                                                            .darkPink,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                Text(
                                                    dateFormatter.format(
                                                        income[index]
                                                            .paymentDateTime
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
