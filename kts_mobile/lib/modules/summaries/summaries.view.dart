import 'dart:async';

import 'package:flutter/material.dart';
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

  //var income = List<IncomeDto>.empty();
  //num? totalIncome = 0;
  //StreamSubscription<void>? fabSubscription = null;
  //CancelToken? cancelToken = CancelToken();
  //String? accoutingPeriodLabel;
  //_IncomesViewState() {}

  @override
  void initState() {
    super.initState();

    /*fabSubscription = widget.fabStream.listen((value) {
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
              "${value.data!.accountingPeriod!.periodStartDate.toLocal().year}/${value.data!.accountingPeriod!.periodEndDate.toLocal().year}";
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) => {EasyLoading.dismiss()});
    */
  }

  @override
  Future dispose() async {
    super.dispose();
    /*if (fabSubscription != null) {
      await fabSubscription!.cancel();
    }
    if (cancelToken != null) {
      cancelToken!.cancel();
    }*/
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
                        //  Icon(
                        //   getCategoryIcon(
                        //       expenseByCategory[index]
                        //           .category),
                        //   color: ThemeColors.darkText,
                        // ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        "No summaries available yet, check back later..",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: 7,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            // onTap: (() => context.pushNamed(
                            //         KtsRoutingLinks.expenses,
                            //         params: {
                            //           'categoryId': expenseByCategory[index]
                            //               .category!
                            //               .id
                            //               .toString()
                            //         })),
                            
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
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tax Liability"
                                                  //      ??
                                                  // "-"
                                                  ,
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    color: ThemeColors.light,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
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
                                                Text("£28,255.07",
                                                    // ${currencyFormatter.format(expenseByCategory[index].total)}

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
