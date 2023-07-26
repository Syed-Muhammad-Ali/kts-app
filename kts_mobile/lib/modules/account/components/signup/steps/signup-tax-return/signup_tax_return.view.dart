import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class SignupTaxReturnView extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(SignupTaxReturnFormData) onSave;

  const SignupTaxReturnView(this.formKey, this.onSave, {Key? key})
      : super(key: key);

  @override
  State<SignupTaxReturnView> createState() => _SignupTaxReturnViewState();
}

class _SignupTaxReturnViewState extends State<SignupTaxReturnView> {
  final balanceOnAccountController = TextEditingController();
  final balanceOnAccountFocusNode = new FocusNode();

  @override
  void dispose() {
    balanceOnAccountController.dispose();
    balanceOnAccountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 24, bottom: 12),
            child: Text(
              "First Tax Return?",
              style: TextStyle(
                  color: ThemeColors.lightPink,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            )),
        Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Text(
              "If you submitted a tax return for the last finacial year and, have a balance on account with HMRC, please tell us how much.",
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
              focusNode: balanceOnAccountFocusNode,
              textCapitalization: TextCapitalization.words,
              validator: MultiValidator([]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                  '', 'e.g. £5,0000',
                  suffixIcon: KtsCustomAppIcons.coins,
                  prefixIcon: KtsCustomAppIcons.pound,
                  showInfo: true),
              autofillHints: const [AutofillHints.name],
              controller: balanceOnAccountController,
              inputFormatters: <TextInputFormatter>[
                DecimalTextInputFormatter(2)
              ],
              onSaved: (newValue) {
                if (balanceOnAccountController.text.isNotEmpty) {
                  widget.onSave(SignupTaxReturnFormData(
                      balanceOnAccount:
                          double.parse(balanceOnAccountController.text)));
                } else {
                  widget.onSave(SignupTaxReturnFormData());
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

class SignupTaxReturnFormData {
  final double? balanceOnAccount;
  SignupTaxReturnFormData({this.balanceOnAccount});
}
