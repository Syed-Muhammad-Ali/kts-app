import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/subscriptions/subscription-helper.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-details/signup_details.view.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-employment/signup_employment.view.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-subscription/signup_subscription.view.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-account/signup_account.view.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-tax-return/signup_tax_return.view.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:kts_mobile/modules/global/error-handling/handle_error.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SignupView extends StatefulWidget {
  final KtsBookingApi apiClient;

  SignupView(this.apiClient, {Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final detailsformKey = GlobalKey<FormState>();
  final employmentformKey = GlobalKey<FormState>();
  final taxReturnformKey = GlobalKey<FormState>();
  final accountformKey = GlobalKey<FormState>();

  SignupDetailsFormData? signupDetailsData;
  SignupEmployementFormData? signupEmployementData;
  SignupTaxReturnFormData? signupTaxReturnFormData;
  SignupSubscriptionFormData? signupSubscriptionFormData;
  SignupAccountFormData? signupAccountFormData;

  String email = "";
  String appUserId = "";

  int currentStepIndex = 0;
  final steps = [0, 1, 2, 3];

  StreamController backStream = StreamController.broadcast();

  _SignupViewState() {}

  Widget _getWidgetByIndex(int index) {
    switch (index) {
      case 0:
        return SignupDetailsView(
            detailsformKey, saveDetails, backStream, "Your Information",
            data: signupDetailsData);
      case 1:
        return SignupEmploymentView(
          employmentformKey,
          saveEmployement,
          backStream,
          "Employment",
          "If you have employment income please enter your annual salary. Click next to skip this section.",
          data: signupEmployementData,
        );
      case 2:
        return SignupSubscriptionView(saveSubscription, backStream);
      case 3:
        return SignupAccountView(
            accountformKey, saveAccount, email, backStream);
      default:
        return SizedBox();
    }
  }

  GlobalKey<FormState>? _getFormKeyByIndex(int index) {
    switch (index) {
      case 0:
        return detailsformKey;
      case 1:
        return employmentformKey;
      case 2:
        return null;
      case 3:
        return accountformKey;
      default:
        return null;
    }
  }

  saveDetails(SignupDetailsFormData data) {
    signupDetailsData = data;
    setState(() {
      email = data.email;
    });
  }

  saveEmployement(SignupEmployementFormData data) {
    signupEmployementData = data;
  }

  saveTaxReturn(SignupTaxReturnFormData data) {
    signupTaxReturnFormData = data;
  }

  saveSubscription(SignupSubscriptionFormData data) {
    signupSubscriptionFormData = data;
  }

  saveAccount(SignupAccountFormData data) {
    signupAccountFormData = data;
  }

  @override
  void initState() {
    super.initState();

    backStream.stream.listen((value) {
      setState(() {
        if (currentStepIndex == 0) {
          context.pushReplacement(KtsRoutingLinks.splash);
        }
        currentStepIndex = currentStepIndex - 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future next() async {
    var formKey = _getFormKeyByIndex(currentStepIndex);

    // if we have a form key call validate
    if (formKey != null && formKey.currentState != null) {
      if (!formKey.currentState!.validate()) {
        return;
      }

      formKey.currentState!.save();
    }

    bool progres = true;

    // run step specific code
    switch (currentStepIndex) {
      case 0:
        progres = await validateDetails();
        break; 
      case 1:
        break;
      case 2:
        progres = await attemptPayment();
        break;
      case 3:
        break;
    }

    if (progres == false) {
      return;
    }

    //increment step OR submit
    if (currentStepIndex < (steps.length - 1)) {
      setState(() {
        currentStepIndex++;
      });
    } else {
      _submit();
    }
  }

  Future<bool> attemptPayment() async {
    try {
      EasyLoading.show(
        status: 'Creating subscription...',
        maskType: EasyLoadingMaskType.black,
      );

      Offerings offerings = await Purchases.getOfferings();
      var offering = offerings.all[SubscriptionHelper.offeringIdentifier];
      if (offering == null) {
        throw Exception("Unable to find offering");
      }
      var package = offering.availablePackages.firstWhereOrNull(
          (P) => P.identifier == SubscriptionHelper.iosPackage);
      if (package == null) {
        throw Exception("Unable to find package");
      }

      //attempt purchase the package
      CustomerInfo customerInfo = await Purchases.purchasePackage(package);

      var standardEntitlement = customerInfo
          .entitlements.all[SubscriptionHelper.standardEntitlementIdentifier];

      if (standardEntitlement == null) {
        throw new Exception("Standard entitlement not found");
      }

      appUserId = customerInfo.originalAppUserId;

      EasyLoading.dismiss();
      return true;
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      EasyLoading.dismiss();
      _showFailedSubscriptionDialog();
    }

    return false;
  }

  Future<bool> validateDetails() async {
    if (signupDetailsData == null || signupDetailsData!.email == "") {
      return Future<bool>.value(false);
    }

    EasyLoading.show(
      status: 'Checking account details...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      var response = await widget.apiClient
          .getAccountReadApi()
          .accountReadAccountExists(email: signupDetailsData!.email);
          print("SignUp response: $response");
      EasyLoading.dismiss();
      if (response.data!.exists) {
        _showAccountExistsDialog(signupDetailsData!.email);
      }
      return !response.data!.exists;
    } on Exception catch (err) {
      EasyLoading.dismiss();
      return false;
    }
  }

  void _submit() {
    var request = SignupRequest((b) => {
          if (signupDetailsData != null)
            {
              b.email = signupDetailsData!.email,
              b.name = signupDetailsData!.name,
              b.dateOfBirth = signupDetailsData!.dob!.toUtc(),
              if (signupDetailsData!.address != null)
                {
                  b.address = AddressDto((a) => {
                        a.addressLine1 =
                            signupDetailsData!.address!.addressLine1,
                        a.addressLine2 =
                            signupDetailsData!.address!.addressLine2,
                        a.county = signupDetailsData!.address!.county,
                        a.postcode = signupDetailsData!.address!.postcode,
                        a.town = signupDetailsData!.address!.town,
                        a.country = signupDetailsData!.country
                      }).toBuilder()
                }
              else
                {
                  b.address = AddressDto((a) => {
                        a.addressLine1 = "-",
                        a.postcode = "-",
                        a.country = signupDetailsData!.country
                      }).toBuilder()
                },
              b.utr = signupDetailsData!.utr,
              b.nino = signupDetailsData!.nino,
              b.appStoreId = appUserId
            },
          if (signupEmployementData != null)
            {
              b.annualEmploymentIncome =
                  signupEmployementData!.annualIncome == null
                      ? 0
                      : signupEmployementData!.annualIncome,
            },
          if (signupSubscriptionFormData != null)
            {b.subscriptionType = signupSubscriptionFormData!.subscription},
          if (signupAccountFormData != null)
            {b.password = signupAccountFormData!.password}
        });

    EasyLoading.show(
      status: 'Creating account...',
      maskType: EasyLoadingMaskType.black,
    );

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteSignup(request: request)
        .then((value) {
      EasyLoading.dismiss();
      var username = signupDetailsData!.email;
      context.go("/login"); //TOD change to route link
    }, onError: (err) {
      EasyLoading.dismiss();
    }).catchError(handleError);
  }

  _showAccountExistsDialog(String email) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Account exists",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "Sorry, It looks like an account with this email already exists, please use another email to sign up or login with your existing account.",
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
              'Try Again',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
          TextButton(
            onPressed: () {
              context.goNamed(KtsRoutingLinks.login);
            },
            child: const Text(
              'Go to login',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
        ],
      ),
    );
  }

  _showFailedSubscriptionDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Failed to subscribe",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "Sorry, An issue occured when subscribing.",
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
              next();
            },
            child: const Text(
              'Try Again',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
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
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/kts-background.png"),
                      fit: BoxFit.cover,
                    )))),
            SafeArea(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: Column(
                    children: [
                      NoInternetConnectionWarning(),
                      SizedBox(height: 12),
                      Row(
                          children: steps
                              .map<Widget>((key) => Flexible(
                                  flex: (100 / steps.length).ceil(),
                                  child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Container(
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: key == this.currentStepIndex
                                                ? ThemeColors.darkPink
                                                : ThemeColors.light,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3))),
                                      ))))
                              .toList()),
                      Expanded(
                          child: SingleChildScrollView(
                              child: _getWidgetByIndex(currentStepIndex))),
                      SizedBox(height: 12),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                              style: KtsAppWidgetStyles.roundButtonStyle(
                                  ThemeColors.lightPink, ThemeColors.darkText),
                              onPressed: () async => await next(),
                              child: Text("Next Step")))
                    ],
                  )),
            )
          ],
        ));
  }
}
