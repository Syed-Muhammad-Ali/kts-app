
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';

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
final _dialog = RatingDialog(
  
    // your app's name?
    title:  Text("Rate Us!",
    style: TextStyle(
    fontSize:18,
    fontWeight: FontWeight.w500
     ),
     textAlign: TextAlign.center,
    ),
    // encourage your user to leave a high rating?
    message:
   const Text('Select Number of Stars 1 - 5 to Rate This App',
   style: TextStyle(
    fontSize:15,
    fontWeight: FontWeight.w500
   ),
   textAlign: TextAlign.center,
   ),
    // your app's logo?
     image: Image.asset("images/app/kts-icon_background.png",
     width: 50,
     height: 50,
     ),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        //go to app store
        StoreRedirect.redirect(androidAppId: 'co.uk.ktsbookkeeping',iOSAppId: 'co.uk.ktsbookkeeping');
      }
    },
  );

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
             padding: EdgeInsets.only(left: 18, right: 18, bottom: 12),
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
                   Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: GestureDetector(
                  onTap: () {
                    showDialog(
              context: context,
              builder: (context) => _dialog,
            );
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
                                "Rate Us",
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
