import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/identity/invalid-credentials.exception.dart';
import 'package:kts_mobile/common/identity/services/authentication.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/subscriptions/subscription-helper.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:launch_review/launch_review.dart';

class ForgotPasswordView extends StatefulWidget {
  final KtsBookingApi apiClient;
  ForgotPasswordView(this.apiClient, {Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

//import identity api
//build login flow
//build signup flow

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final userNameFocusNode = FocusNode();
  bool complete = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _requestReset() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    EasyLoading.show(
      status: 'Requesting reset...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = ForgotPasswordRequest((b) {
      b.emailAddress = usernameController.text;
    });
    widget.apiClient
        .getAccountWriteApi()
        .accountWriteForgotPassword(request: request)
        .then((value) {
      setState(() {
        complete = true;
      });
      EasyLoading.dismiss();
    }, onError: (error) => {EasyLoading.dismiss()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        body: Stack(
          children: [
            SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Stack(children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/kts-background.png"),
                        fit: BoxFit.cover,
                      ))),
                  Positioned(
                      bottom: (-MediaQuery.of(context).size.height) +
                          (MediaQuery.of(context).size.height * 0.55),
                      left: 0,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: Svg('images/kts-pink-overlay.svg'),
                              fit: BoxFit.cover,
                            )),
                          ))),
                ])),
            SafeArea(child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: complete == true
                            ? [
                                Container(
                                    constraints: BoxConstraints(minHeight: 250),
                                    height: constraints.maxHeight * 0.30,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 250,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: Svg(
                                                  'images/kts-logo-full.svg'),
                                              fit: BoxFit.contain,
                                            )))
                                      ],
                                    )),
                                Text("Password",
                                    style: TextStyle(
                                        color: ThemeColors.lightPink,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500)),
                                Text("Reset Successfully",
                                    style: TextStyle(
                                        color: ThemeColors.lightPink,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 12),
                                Text(
                                  "A new password is on its way, check your email, dont forget to check your junk folder!",
                                  style: TextStyle(
                                      color: ThemeColors.lightPink,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 24),
                                TextButton(
                                    style: KtsAppWidgetStyles.roundButtonStyle(
                                        ThemeColors.lightPink,
                                        ThemeColors.darkText),
                                    onPressed: () {
                                      context.goNamed(KtsRoutingLinks.login);
                                    },
                                    child: Text("Back to login")),
                              ]
                            : [
                                Container(
                                    constraints: BoxConstraints(minHeight: 250),
                                    height: constraints.maxHeight * 0.30,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 250,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: Svg(
                                                  'images/kts-logo-full.svg'),
                                              fit: BoxFit.contain,
                                            )))
                                      ],
                                    )),
                                Text("Forgot",
                                    style: TextStyle(
                                        color: ThemeColors.lightPink,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500)),
                                Text("Password?",
                                    style: TextStyle(
                                        color: ThemeColors.lightPink,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 12),
                                Text(
                                  "Don't worry it happens, please enter the email address associated with your account",
                                  style: TextStyle(
                                      color: ThemeColors.lightPink,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 24),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        focusNode: userNameFocusNode,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText:
                                                  "Please enter your email address"),
                                        ]),
                                        style:
                                            KtsAppWidgetStyles.fieldTextStyle(),
                                        decoration: KtsAppWidgetStyles
                                            .fieldInputDdecoration('Email',
                                                'e.g. karen@hotmail.com',
                                                suffixIcon:
                                                    KtsCustomAppIcons.person,
                                                showInfo: false),
                                        autofillHints: const [
                                          AutofillHints.email
                                        ],
                                        controller: usernameController,
                                      ),
                                      const SizedBox(height: 24),
                                      TextButton(
                                          style: KtsAppWidgetStyles
                                              .roundButtonStyle(
                                                  ThemeColors.lightPink,
                                                  ThemeColors.darkText),
                                          onPressed: () async =>
                                              await _requestReset(),
                                          child: Text("Reset")),
                                      Padding(
                                          padding: EdgeInsets.only(top: 24),
                                          child: GestureDetector(
                                              onTap: () {
                                                context.goNamed(
                                                    KtsRoutingLinks.login);
                                              },
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Click here to ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              KtsAppWidgetStyles
                                                                  .fontFamily,
                                                          color:
                                                              ThemeColors.light,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Text(
                                                      "login..",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              KtsAppWidgetStyles
                                                                  .fontFamily,
                                                          color:
                                                              ThemeColors.light,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ])))
                                    ],
                                  ),
                                )
                              ],
                      )));
            })),
          ],
        ));
  }
}
