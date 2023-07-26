import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-details/signup_details.view.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-employment/signup_employment.view.dart';

class EmploymentInfoView extends StatefulWidget {
  final KtsBookingApi apiClient;

  EmploymentInfoView(this.apiClient, {Key? key}) : super(key: key);

  @override
  State<EmploymentInfoView> createState() => _EmploymentInfoViewState();
}

class _EmploymentInfoViewState extends State<EmploymentInfoView> {
  final formKey = GlobalKey<FormState>();
  SignupEmployementFormData? formData;
  StreamController backStream = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    var account = AppService().loggedInAccount!;

    formData =
        SignupEmployementFormData(annualIncome: account.annualEmploymentIncome);

    backStream.stream.listen((event) {
      context.pop();
    });
  }

  _save(SignupEmployementFormData data) {
    var account = AppService().loggedInAccount!;
    var request = UpdateAccountRequest(((b) {
      b.name = account.name;
      b.dateOfBirth = account.dateOfBirth!.toUtc();
      b.annualEmploymentIncome = data.annualIncome ?? 0;
      b.nino = account.nationalInsuranceNumber;
      b.utr = account.utr;
      b.address = AddressDto((a) => {
            a.addressLine1 = account.address!.addressLine1,
            a.addressLine2 = account.address!.addressLine2,
            a.county = account.address!.county,
            a.postcode = account.address!.postcode,
            a.town = account.address!.town,
            a.country = account.address!.country
          }).toBuilder();
    }));

    EasyLoading.show(
      status: 'Updating employment income...',
      maskType: EasyLoadingMaskType.black,
    );

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteUpdateAccount(request: request)
        .then((value) {
      EasyLoading.dismiss();
      AppService().updateLoggedInUser().then((value) {
        _back();
      });
    }, onError: (err) {
      EasyLoading.dismiss();
    });
  }

  _back() {
    GoRouter.of(context).pushReplacementNamed(KtsRoutingLinks.settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        body: Stack(children: [
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
              child: Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: SignupEmploymentView(
                formKey,
                (data) {
                  _save(data);
                },
                backStream,
                "Employment",
                "If you have employment income please enter your annual salary.",
                data: formData,
              ))),
              SizedBox(height: 12),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      style: KtsAppWidgetStyles.roundButtonStyle(
                          ThemeColors.lightPink, ThemeColors.darkText),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                      child: Text("Save")))
            ]),
          ))
        ]));
  }
}
