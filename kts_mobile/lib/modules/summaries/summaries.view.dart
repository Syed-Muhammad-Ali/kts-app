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
                  Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        "Summaries",
                        style: TextStyle(
                            color: ThemeColors.lightPink,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        "No summaries available yet, check back later..",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                ],
              ))
        ])),
      ],
    );
  }
}
