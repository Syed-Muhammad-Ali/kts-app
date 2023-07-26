import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupSubscriptionView extends StatefulWidget {
  final Function(SignupSubscriptionFormData) onSave;
  final StreamController? backStream;

  const SignupSubscriptionView(this.onSave, this.backStream, {Key? key})
      : super(key: key);

  @override
  State<SignupSubscriptionView> createState() => _SignupSubscriptionViewState();
}

class _SignupSubscriptionViewState extends State<SignupSubscriptionView> {
  SubscriptionType? _selectedSubscription;

  SubscriptionType? get selectedSubscription {
    return _selectedSubscription;
  }

  set selectedSubscription(SubscriptionType? value) {
    _selectedSubscription = value;
    widget.onSave(SignupSubscriptionFormData(selectedSubscription!));
  }

  @override
  void initState() {
    super.initState();
    selectedSubscription = SubscriptionType.standard;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 24, bottom: 12),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        onPressed: () {
                          widget.backStream!.add(null);
                        },
                      )),
                  Text(
                    "Choose Your Plan",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: ThemeColors.lightPink,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  )
                ])),
        // Subsctiption Standard Radio Start
        Padding(
            padding: EdgeInsets.only(top: 12, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Standard",
                  style: TextStyle(
                      color: ThemeColors.lightPink,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select this plan",
                      style: TextStyle(
                        color: ThemeColors.light,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                    ),
                    Transform.scale(
                        scale: 1.25,
                        child: Radio<SubscriptionType>(
                          value: SubscriptionType.standard,
                          groupValue: selectedSubscription,
                          onChanged: (SubscriptionType? value) {
                            setState(() {
                              selectedSubscription = value;
                            });
                          },
                        ))
                  ],
                )
              ],
            )),
        // Subsctiption Standard Radio End

        // Subsctiption Standard Details Start
        Padding(
            padding: EdgeInsets.only(top: 0, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeColors.light,
                              ),
                              color: ThemeColors.light,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          height: 45,
                          width: 45,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              "images/icons/check_icon.svg",
                            ),
                          )),
                      Container(
                        width: 7,
                        height: 140,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [ThemeColors.light, ThemeColors.charcole],
                        )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeColors.charcole,
                              ),
                              color: ThemeColors.charcole,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          height: 45,
                          width: 45,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              "images/icons/check_icon.svg",
                              color: ThemeColors.light,
                            ),
                          ))
                    ])),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Record Income",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Text(
                        "Record your income using the appointment calendar or simply input your daily sales.",
                        style:
                            TextStyle(color: ThemeColors.light, fontSize: 12)),
                    const SizedBox(height: 24),
                    Text("Record Expenses",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Text("Record all expenses and capture receipts",
                        style:
                            TextStyle(color: ThemeColors.light, fontSize: 12)),
                    const SizedBox(height: 24),
                    Text("Monitor Performance",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Text("Understand your business performance",
                        style:
                            TextStyle(color: ThemeColors.light, fontSize: 12)),
                    const SizedBox(height: 24),
                    Text("Tax Liability",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Text("Know your tax liability as you go",
                        style:
                            TextStyle(color: ThemeColors.light, fontSize: 12))
                  ],
                ))
              ],
            )),
        // Subsctiption Standard Details End

        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ThemeColors.darkGrey),
            child: Padding(
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 18, bottom: 18),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Monthly",
                          style: TextStyle(
                              color: ThemeColors.darkPink,
                              fontFamily: KtsAppWidgetStyles.fontFamily,
                              fontWeight: FontWeight.w600)),
                      Text("£6.99/Month",
                          style: TextStyle(
                              color: ThemeColors.darkPink,
                              fontFamily: KtsAppWidgetStyles.fontFamily,
                              fontWeight: FontWeight.w600))
                    ]))),

        Padding(
            padding: EdgeInsets.only(top: 24),
            child: Align(
                alignment: Alignment.center,
                child: Text("You can cancel anytime on the app store",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ThemeColors.light,
                        fontFamily: KtsAppWidgetStyles.fontFamily,
                        fontWeight: FontWeight.w300,
                        fontSize: 12)))),

        Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://kts-prod-api.azurewebsites.net/privacy-policy.html"));
                    },
                    child: Text("Privacy Policy",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300))),
                Text(" | ", style: TextStyle(color: ThemeColors.darkPink)),
                GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://kts-prod-api.azurewebsites.net/terms-of-use.html"));
                    },
                    child: Text("Terms of Use",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300))),
              ],
            )),

        /*
        // Subsctiption Premium Radio Start
        Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Premium",
                  style: TextStyle(
                      color: ThemeColors.lightPink,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select this plan",
                      style: TextStyle(
                        color: ThemeColors.light,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                    ),
                    Transform.scale(
                        scale: 1.25,
                        child: Radio<SubscriptionType>(
                          value: SubscriptionType.premium,
                          groupValue: selectedSubscription,
                          onChanged: (SubscriptionType? value) {
                            setState(() {
                              selectedSubscription = value;
                            });
                          },
                        ))
                  ],
                )
              ],
            )),
        // Subsctiption Premium Radio End

        // Subsctiption Standard Details Start
        Padding(
            padding: EdgeInsets.only(top: 0, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeColors.light,
                              ),
                              color: ThemeColors.light,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          height: 45,
                          width: 45,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              "images/icons/check_icon.svg",
                            ),
                          )),
                      Container(
                        width: 7,
                        height: 60,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [ThemeColors.light, ThemeColors.charcole],
                        )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeColors.charcole,
                              ),
                              color: ThemeColors.charcole,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          height: 45,
                          width: 45,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              "images/icons/check_icon.svg",
                              color: ThemeColors.light,
                            ),
                          ))
                    ])),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lorem Ipsum",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
                        style:
                            TextStyle(color: ThemeColors.light, fontSize: 12)),
                    SizedBox(height: 24),
                    Text("Lorem Ipsum",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
                        style:
                            TextStyle(color: ThemeColors.light, fontSize: 12))
                  ],
                ))
              ],
            )),
        // Subsctiption Standard Details End

        */
      ],
    );
  }
}

class SignupSubscriptionFormData {
  final SubscriptionType subscription;
  SignupSubscriptionFormData(this.subscription);
}
