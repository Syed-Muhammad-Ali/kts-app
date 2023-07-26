import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-details/signup_details.view.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-employment/signup_employment.view.dart';

class ChangePasswordView extends StatefulWidget {
  final KtsBookingApi apiClient;

  ChangePasswordView(this.apiClient, {Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewViewState();
}

class _ChangePasswordViewViewState extends State<ChangePasswordView> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmPasswordController = TextEditingController();
  final confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  _save() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var request = ChangePasswordRequest(((b) {
      b.password = passwordController.text;
    }));

    EasyLoading.show(
      status: 'Changing your password...',
      maskType: EasyLoadingMaskType.black,
    );

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteChangePassword(request: request)
        .then((value) {
      EasyLoading.dismiss();
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                              onPressed: () => context.pop(),
                            )),
                        Text(
                          "Change Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: ThemeColors.lightPink,
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
                      child: Text(
                        "Enter and confirm your new password",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                  SizedBox(height: 24),
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Form(
                        key: formKey,
                        child: Column(children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: passwordFocusNode,
                            obscureText: true,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Please enter a password"),
                            ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Password', 'Enter a secure password',
                                    suffixIcon: KtsCustomAppIcons.lock),
                            autofillHints: const [AutofillHints.password],
                            controller: passwordController,
                            onEditingComplete: () {
                              confirmPasswordFocusNode.requestFocus();
                            },
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: confirmPasswordFocusNode,
                            obscureText: true,
                            validator: (val) => MatchValidator(
                                    errorText: 'passwords do not match')
                                .validateMatch(
                                    val ?? "", passwordController.text),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Confirm Password', 'Confirm your password',
                                    suffixIcon: KtsCustomAppIcons.lock),
                            autofillHints: const [AutofillHints.password],
                            controller: confirmPasswordController,
                          ),
                        ]),
                      )),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                              style: KtsAppWidgetStyles.roundButtonStyle(
                                  ThemeColors.lightPink, ThemeColors.darkText),
                              onPressed: () {
                                _save();
                              },
                              child: Text("Change password"))))
                ]),
          ))
        ]));
  }
}
