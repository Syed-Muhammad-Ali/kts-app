import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

class SettingsView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final StreamController<void> showAdd;

  SettingsView(this.apiClient, this.showAdd, {Key? key}) : super(key: key) {}

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");

  bool yourInfoExpanded = false;
  bool employementInfoExpanded = false;

  _SettingsViewState() {}

  @override
  void initState() {
    super.initState();
    widget.showAdd.add(false);
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  _confirmDeletionDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Delete Account",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "Please confirm you would like to delete your account, all account data will be deleted and once done cannot be reversed?",
          style: TextStyle(
              fontFamily: KtsAppWidgetStyles.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ThemeColors.light),
        ),
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteAccount();
            },
            child: const Text(
              'Yes, Delete account',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          )
        ],
      ),
    );
  }

  _deleteAccount() {
    EasyLoading.show(
      status: 'Deleting your account...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient.getAccountWriteApi().accountWriteDelete().then((value) {
      EasyLoading.showSuccess("Customer deleted successfully",
              duration: Duration(seconds: 1))
          .then((value) async {
        await AppService().logout();
        context.goNamed(KtsRoutingLinks.login);
      });
    }, onError: (error) => EasyLoading.dismiss());
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
                        fit: BoxFit.cover)))),
        SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
              child: Row(
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
                            onPressed: () =>
                                context.goNamed(KtsRoutingLinks.overview))),
                    Expanded(
                        child: Text(
                      "Settings",
                      style: TextStyle(
                          color: ThemeColors.lightPink,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                      softWrap: true,
                    ))
                  ])),
          Padding(
              padding: EdgeInsets.only(top: 6, bottom: 12, left: 24),
              child: Text(
                "Manage app settings",
                style: TextStyle(
                    color: ThemeColors.light,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: 24, left: 18, right: 18, bottom: 12),
              child: GestureDetector(
                  onTap: () {
                    context.goNamed(KtsRoutingLinks.edit_account_details);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: ThemeColors.darkGrey),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Information",
                                style: TextStyle(
                                    color: ThemeColors.lightPink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ThemeColors.darkPink,
                                size: 24,
                              )
                            ])),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 12),
              child: GestureDetector(
                  onTap: () {
                    context.goNamed(KtsRoutingLinks.edit_employment_income);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: ThemeColors.darkGrey),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Employment Details",
                                style: TextStyle(
                                    color: ThemeColors.lightPink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ThemeColors.darkPink,
                                size: 24,
                              )
                            ])),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 12),
              child: GestureDetector(
                  onTap: () {
                    context.goNamed(KtsRoutingLinks.customers);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: ThemeColors.darkGrey),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Manage Customers",
                                style: TextStyle(
                                    color: ThemeColors.lightPink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ThemeColors.darkPink,
                                size: 24,
                              )
                            ])),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 12),
              child: GestureDetector(
                  onTap: () {
                    context.goNamed(KtsRoutingLinks.services);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: ThemeColors.darkGrey),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Manage Services",
                                style: TextStyle(
                                    color: ThemeColors.lightPink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ThemeColors.darkPink,
                                size: 24,
                              )
                            ])),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: GestureDetector(
                  onTap: () {
                    context.goNamed(KtsRoutingLinks.change_password);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: ThemeColors.darkGrey),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                    color: ThemeColors.lightPink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ThemeColors.darkPink,
                                size: 24,
                              )
                            ])),
                  ))),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 18, right: 18, bottom: 12),
                            child: TextButton(
                              style: KtsAppWidgetStyles.roundButtonStyle(
                                  ThemeColors.lightPink, ThemeColors.darkText),
                              onPressed: () async {
                                await AppService().logout();
                                context.goNamed(KtsRoutingLinks.login);
                              },
                              child: Text("Logout"),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 18, right: 18, bottom: 12),
                            child: TextButton(
                              onPressed: () async {
                                _confirmDeletionDialog();
                              },
                              child: Text(
                                "Delete Account",
                                style: TextStyle(
                                    color: ThemeColors.light,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal),
                              ),
                            ))
                      ])))
        ]))
      ],
    );
  }
}
