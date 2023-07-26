import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/info-prompt/info-prompt.dart';
import 'package:kts_mobile/modules/global/info-prompts.dart';

class SignupEmploymentView extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(SignupEmployementFormData) onSave;
  final SignupEmployementFormData? data;
  final StreamController? backStream;
  final String title;
  final String subTitle;

  const SignupEmploymentView(
      this.formKey, this.onSave, this.backStream, this.title, this.subTitle,
      {Key? key, this.data})
      : super(key: key);

  @override
  State<SignupEmploymentView> createState() => _SignupEmploymentViewState();
}

class _SignupEmploymentViewState extends State<SignupEmploymentView> {
  final yearlySaleryController = TextEditingController();
  final yearlySaleryFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.data != null && widget.data!.annualIncome != null) {
      yearlySaleryController.text = widget.data!.annualIncome.toString();
    }
    yearlySaleryFocusNode.requestFocus();
  }

  @override
  void dispose() {
    yearlySaleryController.dispose();
    yearlySaleryFocusNode.dispose();
    super.dispose();
  }

  _showInfoDialog(String message) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => InfoPrompt(message));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    widget.title,
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
              widget.subTitle,
              style: TextStyle(
                  color: ThemeColors.lightPink,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            )),
        Form(
          key: widget.formKey,
          child: Column(children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: yearlySaleryFocusNode,
              textCapitalization: TextCapitalization.words,
              validator: MultiValidator([]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                  '', 'e.g. £18,000',
                  suffixIcon: KtsCustomAppIcons.coins,
                  prefixIcon: KtsCustomAppIcons.pound,
                  showInfo: true, showInfoCalback: () {
                _showInfoDialog(InfoPromptConstants.employmentIncomeText);
              }),
              autofillHints: const [AutofillHints.name],
              controller: yearlySaleryController,
              inputFormatters: <TextInputFormatter>[
                DecimalTextInputFormatter(2)
              ],
              onSaved: (newValue) {
                if (yearlySaleryController.text.isNotEmpty) {
                  widget.onSave(SignupEmployementFormData(
                      annualIncome: double.parse(yearlySaleryController.text)));
                } else {
                  widget.onSave(SignupEmployementFormData());
                }
              },
            ),
            SizedBox(height: 30),
          ]),
        ),
      ],
    );
  }
}

class SignupEmployementFormData {
  final num? annualIncome;
  SignupEmployementFormData({this.annualIncome});
}
