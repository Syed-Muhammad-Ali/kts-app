import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/config/kts_environment.dart';
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

class LoginView extends StatefulWidget {
  final KtsBookingApi apiClient;
  LoginView(this.apiClient, {Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

//import identity api
//build login flow
//build signup flow

class _LoginViewState extends State<LoginView> {
  // if the user has not yet signed up show signup option
  // when a user signs in store the login details and refresh token in secure storeage
  // if an account is found dont show signup
  bool showSignup = true;
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final userNameFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    EasyLoading.show(
      status: 'Attempting sign in...',
      maskType: EasyLoadingMaskType.black,
    );
    PackageInfo.fromPlatform().then((packageInfo) {
      widget.apiClient
          .getAccountReadApi()
          .accountReadShouldUpdate(versionLabel: packageInfo.version)
          .then((value) {
        if (value.data == true) {
          EasyLoading.dismiss();
          _showForceUpdateDialog();
        } else {
          AppService().retrieveToken().then((token) {
            if (token != null && token.hasExpired() == false) {
              AppService().login(token).then((value) {
                loggedIn().then((value) {
                  EasyLoading.dismiss();
                }, onError: (error) {
                  EasyLoading.dismiss();
                });
                EasyLoading.dismiss();
              }, onError: (err) {
                EasyLoading.dismiss();
              });
            } else {
              EasyLoading.dismiss();
            }
          }, onError: (err) {
            EasyLoading.dismiss();
          });
        }
      }, onError: (error) {
        EasyLoading.dismiss();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    EasyLoading.show(
      status: 'Signing in to your account...',
      maskType: EasyLoadingMaskType.black,
    );

    AuthenticationService()
        .getAccessToken(
            this.usernameController.text, this.passwordController.text)
        .then((value) {
      AppService().login(value).then((value) async {
        await loggedIn();
      });
    }, onError: (err) {
      if (err is InvalidCredentialsException) {
        _showInvalidCredentialsDialog();
      } else {
        //TODO show global error message
      }
      EasyLoading.dismiss();
    });
  }

  Future loggedIn() async {
    if (AppService().loggedInAccount!.isTestAccount == false) {
      await _configurePurchases();

      Purchases.getCustomerInfo().then((customerInfo) {
        var standardEntitlement = customerInfo
            .entitlements.all[SubscriptionHelper.standardEntitlementIdentifier];

        if (standardEntitlement == null ||
            standardEntitlement.isActive == false) {
          _showInactiveSubscriptionDialog(customerInfo.managementURL ?? "");
        } else {
          context.go("/overview");
        }

        EasyLoading.dismiss();
      });
    } else {
      context.go("/overview");
    }
  }

  Future _configurePurchases() async {
    PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration =
          PurchasesConfiguration(KtsEnvironment().config.androidSdkKey);
    } else {
      configuration = PurchasesConfiguration(KtsEnvironment().config.iosSdkKey);
    }
    configuration.appUserID = AppService().loggedInAccount!.appStoreUserId;
    await Purchases.configure(configuration);
  }

  _showInvalidCredentialsDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Sign in",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "Sorry, we cant find an account matching the email and password provided, please try again or sign up to create an account",
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
              userNameFocusNode.requestFocus();
              Navigator.pop(context);
            },
            child: const Text(
              'Try Again',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
        ],
      ),
    );
  }

  _showInactiveSubscriptionDialog(String managementUrl) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Subscripion inactive",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "Your subscription is inactive, please update to login",
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
              launchUrl(Uri.parse(managementUrl));
            },
            child: const Text(
              'Update',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
        ],
      ),
    );
  }

  _showForceUpdateDialog() {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Update",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "A new version of the app is available, please update now.",
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
              LaunchReview.launch();
            },
            child: const Text(
              'Update now',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
        ],
      ),
    );
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
                  Positioned(
                      bottom: 0,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 48),
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: GestureDetector(
                                      onTap: () => context.go("/signup"),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "By logging in you agree to our",
                                              style: TextStyle(
                                                  fontFamily: KtsAppWidgetStyles
                                                      .fontFamily,
                                                  color: ThemeColors.light,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300)),
                                          TextSpan(text: "\n"),
                                          TextSpan(
                                            text: "privacy policy",
                                            style: TextStyle(
                                                fontFamily: KtsAppWidgetStyles
                                                    .fontFamily,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: ThemeColors.light,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    launchUrl(Uri.parse(
                                                        "https://kts-prod-api.azurewebsites.net/privacy-policy.html"));
                                                  },
                                          ),
                                          TextSpan(
                                              text: " and ",
                                              style: TextStyle(
                                                  fontFamily: KtsAppWidgetStyles
                                                      .fontFamily,
                                                  color: ThemeColors.light,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300)),
                                          TextSpan(
                                            text: "terms of use",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontFamily: KtsAppWidgetStyles
                                                    .fontFamily,
                                                color: ThemeColors.light,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    launchUrl(Uri.parse(
                                                        "https://kts-prod-api.azurewebsites.net/terms-of-use.html"));
                                                  },
                                          ),
                                        ]),
                                      ))))))
                ])),
            SafeArea(child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      constraints: BoxConstraints(minHeight: 250),
                      height: constraints.maxHeight * 0.40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: Svg('images/kts-logo-full.svg'),
                                fit: BoxFit.contain,
                              )))
                        ],
                      )),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: userNameFocusNode,
                              textCapitalization: TextCapitalization.none,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText:
                                        "Please enter your email address"),
                              ]),
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'Email', 'e.g. karen@hotmail.com',
                                      suffixIcon: KtsCustomAppIcons.person,
                                      showInfo: false),
                              autofillHints: const [AutofillHints.email],
                              controller: usernameController,
                              onEditingComplete: () {
                                if (usernameController.text != "") {
                                  passwordFocusNode.requestFocus();
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: passwordFocusNode,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Please enter your password"),
                              ]),
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                    color: ThemeColors.light,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColors.light, width: 2.0),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3.0,
                                    color: ThemeColors.darkPink,
                                  ),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3.0,
                                    color: ThemeColors.error,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                    color: ThemeColors.error,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    color: ThemeColors.grey10,
                                    fontWeight: FontWeight.w400),
                                contentPadding: EdgeInsets.only(bottom: 6),
                                suffix: GestureDetector(
                                    onTap: () {
                                      context.goNamed(
                                          KtsRoutingLinks.forgot_password);
                                    },
                                    child: Text("Forgot?",
                                        style: TextStyle(
                                            color: ThemeColors.light))),
                                suffixIcon: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(KtsCustomAppIcons.lock,
                                          size: 14, color: ThemeColors.darkPink)
                                    ]),
                              ),
                              autofillHints: const [AutofillHints.password],
                              controller: passwordController,
                              obscureText: true,
                              onEditingComplete: () async {
                                await _login();
                              },
                            ),
                            const SizedBox(height: 48),
                            TextButton(
                                style: KtsAppWidgetStyles.roundButtonStyle(
                                    ThemeColors.lightPink,
                                    ThemeColors.darkText),
                                onPressed: () async => await _login(),
                                child: Text("Sign in")),
                            Padding(
                                padding: EdgeInsets.only(top: 24),
                                child: GestureDetector(
                                    onTap: () {
                                      context.go(KtsRoutingLinks.splash);
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Dont have an account? Click here to ",
                                            style: TextStyle(
                                                fontFamily: KtsAppWidgetStyles
                                                    .fontFamily,
                                                color: ThemeColors.light,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            "signup..",
                                            style: TextStyle(
                                                fontFamily: KtsAppWidgetStyles
                                                    .fontFamily,
                                                color: ThemeColors.light,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ])))
                          ],
                        )),
                  )
                ],
              ));
            })),
          ],
        ));
  }
}
