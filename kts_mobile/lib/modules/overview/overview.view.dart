import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/overview/overview-stats.dart';

class OverviewView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final StreamController<void> showAdd;

  OverviewView(this.apiClient, this.showAdd, {Key? key}) : super(key: key) {}

  @override
  State<OverviewView> createState() => _OverviewViewViewState();
}

class _OverviewViewViewState extends State<OverviewView> {
  _OverviewViewViewState() {}
  AccountingPeriodOverviewStats? current;
  AccountingPeriodOverviewStats? forecasted;

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    widget.showAdd.add(false);
    EasyLoading.show(
      status: 'Loading overview...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountReadApi()
        .accountReadGetAccoutingPeriodOverview()
        .then((value) {
      if (value.data != null) {
        setState(() {
          current = value.data!.current;
          forecasted = value.data!.forecasted;
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) {
      EasyLoading.dismiss();
    });
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          child: DefaultTabController(
              length: 2,
              child: Column(children: [
                Container(
                    color: Colors.transparent,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      indicatorWeight: 1,
                      indicatorPadding: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      labelPadding: EdgeInsets.all(0),
                      onTap: (value) {
                        setState(() {
                          selectedTab = value;
                        });
                      },
                      tabs: [
                        Tab(
                            child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: selectedTab == 1
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                            image: Svg(
                                                "images/overview/tab-background.svg"),
                                            fit: BoxFit.fitWidth),
                                      )
                                    : null,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Current",
                                      style: TextStyle(
                                          color: ThemeColors.darkPink,
                                          fontFamily:
                                              KtsAppWidgetStyles.fontFamily,
                                          fontSize: 15,
                                          fontWeight: selectedTab == 1
                                              ? FontWeight.w300
                                              : FontWeight.w600),
                                    )))),
                        Tab(
                            child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: selectedTab == 0
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                            image: Svg(
                                                "images/overview/tab-background.svg"),
                                            fit: BoxFit.fitWidth),
                                      )
                                    : null,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Forecasted",
                                      style: TextStyle(
                                          color: ThemeColors.darkPink,
                                          fontFamily:
                                              KtsAppWidgetStyles.fontFamily,
                                          fontSize: 15,
                                          fontWeight: selectedTab == 0
                                              ? FontWeight.w300
                                              : FontWeight.w600),
                                    )))),
                      ],
                    )),
                Expanded(
                    child: TabBarView(
                  children: [
                    this.current == null
                        ? SizedBox()
                        : OverviewStats(this.current!,false),
                    this.forecasted == null
                        ? SizedBox()
                        : OverviewStats(this.forecasted!,true),
                  ],
                ))
              ])))
    ]);
  }
}
