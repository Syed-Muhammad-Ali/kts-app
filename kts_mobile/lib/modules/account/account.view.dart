import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-details/signup_details.view.dart';

class AccountView extends StatefulWidget {
  final KtsBookingApi apiClient;

  AccountView(this.apiClient, {Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final formKey = GlobalKey<FormState>();
  SignupDetailsFormData? formData;
  StreamController backStream = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    var account = AppService().loggedInAccount!;

    formData = SignupDetailsFormData(
        account.user!.username!,
        account.name!,
        account.address!.country,
        account.dateOfBirth,
        account.address!,
        account.nationalInsuranceNumber!,
        account.utr!);
        
      backStream.stream.listen((event) {
      context.pop();
    });
  }

  _save(SignupDetailsFormData data) {
    var account = AppService().loggedInAccount!;
    var request = UpdateAccountRequest(((b) {
      b.email = data.email;
      b.name = data.name;
      b.dateOfBirth = data.dob != null ? data.dob!.toUtc() : null;
      b.annualEmploymentIncome = account.annualEmploymentIncome ?? 0;
      b.nino = data.nino;
      b.utr = data.utr;
      if (data.address != null) {
        b.address = AddressDto((a) => {
              a.addressLine1 = data.address!.addressLine1,
              a.addressLine2 = data.address!.addressLine2,
              a.county = data.address!.county,
              a.postcode = data.address!.postcode,
              a.town = data.address!.town,
              a.country = data.country
            }).toBuilder();
      }
    }));

    EasyLoading.show(
      status: 'Updating account...',
      maskType: EasyLoadingMaskType.black,
    );

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteUpdateAccount(request: request)
        .then((value) {
      EasyLoading.dismiss();
      AppService().updateLoggedInUser();
      _back();
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
                      child: SignupDetailsView(
                formKey,
                (data) {
                  _save(data);
                },
                backStream,
                "Your Information",
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
