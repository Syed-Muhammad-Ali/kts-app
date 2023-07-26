import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/modules/account/components/signup/steps/signup-details/signup_details-keys.dart';

import '../../../../../../common/theme/theme_styles.dart';

class SignupAccountView extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(SignupAccountFormData) onSave;
  String email;
  final StreamController? backStream;

  SignupAccountView(this.formKey, this.onSave, this.email, this.backStream,
      {Key? key})
      : super(key: key);

  @override
  State<SignupAccountView> createState() => _SignupAccountViewState();
}

class _SignupAccountViewState extends State<SignupAccountView> {
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmPasswordController = TextEditingController();
  final confirmPasswordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  "Nearly there…",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ThemeColors.lightPink,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                )
              ])),
      Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Text(
            "To complete sign up simply create and confirm your password below.",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          )),
      Padding(
          padding: EdgeInsets.only(top: 12, bottom: 24),
          child: Text(
            widget.email,
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
            textAlign: TextAlign.center,
          )),
      Form(
        key: widget.formKey,
        child: Column(children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            focusNode: passwordFocusNode,
            obscureText: true,
            validator: MultiValidator([
              RequiredValidator(errorText: "Please enter a password"),
            ]),
            style: KtsAppWidgetStyles.fieldTextStyle(),
            decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                'Create Password', 'Enter a secure password',
                suffixIcon: KtsCustomAppIcons.lock),
            autofillHints: const [AutofillHints.password],
            controller: passwordController,
            onEditingComplete: () {
              confirmPasswordFocusNode.requestFocus();
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            focusNode: confirmPasswordFocusNode,
            obscureText: true,
            validator: (val) =>
                MatchValidator(errorText: 'passwords do not match')
                    .validateMatch(val ?? "", passwordController.text),
            style: KtsAppWidgetStyles.fieldTextStyle(),
            decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                'Confirm Password', 'Confirm your password',
                suffixIcon: KtsCustomAppIcons.lock),
            autofillHints: const [AutofillHints.password],
            controller: confirmPasswordController,
            onSaved: ((newValue) {
              widget.onSave(SignupAccountFormData(passwordController.text));
            }),
          ),
        ]),
      ),
    ]);
  }
}

class SignupAccountFormData {
  final String password;
  SignupAccountFormData(this.password);
}
