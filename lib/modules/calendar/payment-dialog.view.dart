import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:intl/intl.dart';
import '../../common/theme/theme_colors.dart';

class PaymentDialogView extends StatefulWidget {
  PaymentDialogView({Key? key}) : super(key: key);

  @override
  State<PaymentDialogView> createState() => _PaymentDialogViewState();
}

class _PaymentDialogViewState extends State<PaymentDialogView> {
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");
  final dateFormatter = new DateFormat('dd/MM/yyyy');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController paymentAmountController = TextEditingController();
  final FocusNode paymentAmountFocusNode = FocusNode();
  DateTime? _paymentDate;
  final TextEditingController paymentDateController = TextEditingController();
  final FocusNode paymentDateFocusNode = FocusNode();
  DateTime? get paymentDate {
    return _paymentDate;
  }

  set paymentDate(DateTime? value) {
    _paymentDate = value;
    if (_paymentDate != null) {
      paymentDateController.text = dateFormatter.format(_paymentDate!);
    } else {
      paymentDateController.clear();
    }
  }

  final FocusNode paymentMethodFocusNode = FocusNode();
  PaymentMethod? selectedPaymentMethod;

  confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var income = IncomeDto((b) {
      b.id = 0;
      b.paymentDateTime = paymentDate;
      b.amount = num.parse(paymentAmountController.text);
      b.paymentMethod = selectedPaymentMethod;
    });

    Navigator.pop(context, income);
  }

  @override
  void initState() {
    super.initState();
    paymentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeColors.darkGrey,
                ),
                color: ThemeColors.darkGrey,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: ThemeColors.lightPink,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Record an appointment payment",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 12),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  focusNode: paymentDateFocusNode,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Payment Date is required"),
                                  ]),
                                  style: KtsAppWidgetStyles.fieldTextStyle(),
                                  decoration:
                                      KtsAppWidgetStyles.fieldInputDdecoration(
                                          'Payment Date', 'e.g. 21/07/2023',
                                          suffixIcon: KtsCustomAppIcons
                                              .calendar_plus_o),
                                  autofillHints: const ["payment date"],
                                  controller: paymentDateController,
                                  readOnly: true,
                                  onTap: () async {
                                    paymentDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          paymentDate ?? DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );

                                    if (paymentDate != null) {
                                      paymentDateFocusNode.requestFocus();
                                    }
                                  }),
                              const SizedBox(height: 24),
                              DropdownButtonFormField<PaymentMethod>(
                                  value: selectedPaymentMethod,
                                  focusNode: paymentMethodFocusNode,
                                  icon: const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: const Icon(Icons
                                          .arrow_drop_down_circle_outlined)),
                                  isExpanded: true,
                                  elevation: 16,
                                  style: KtsAppWidgetStyles.fieldTextStyle(),
                                  dropdownColor: ThemeColors.darkGrey,
                                  iconEnabledColor: ThemeColors.darkPink,
                                  decoration:
                                      KtsAppWidgetStyles.fieldInputDdecoration(
                                          'Payment Method', 'e.g. Debit Card'),
                                  onChanged: (PaymentMethod? value) {
                                    setState(() {
                                      selectedPaymentMethod = value!;
                                      if (selectedPaymentMethod != null) {
                                        paymentAmountFocusNode.requestFocus();
                                      }
                                    });
                                  },
                                  validator: (value) =>
                                      selectedPaymentMethod == null
                                          ? "Payment Method is required"
                                          : null,
                                  items: [
                                    DropdownMenuItem<PaymentMethod>(
                                      value: PaymentMethod.bank,
                                      child: Text("Bank"),
                                    ),
                                    DropdownMenuItem<PaymentMethod>(
                                      value: PaymentMethod.cash,
                                      child: Text(
                                        "Cash",
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                focusNode: paymentAmountFocusNode,
                                textCapitalization: TextCapitalization.words,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Payment Amount is required"),
                                ]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Payment Amount', 'e.g. £32.50',
                                        suffixIcon: KtsCustomAppIcons.coins,
                                        showInfo: false),
                                autofillHints: const [AutofillHints.name],
                                controller: paymentAmountController,
                                inputFormatters: <TextInputFormatter>[
                                  DecimalTextInputFormatter(2)
                                ],
                                onEditingComplete: () {
                                  paymentDateFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextButton(
                                  style: KtsAppWidgetStyles.roundButtonStyle(
                                      ThemeColors.lightPink,
                                      ThemeColors.darkText,
                                      minSize: 30),
                                  onPressed: () => confirm(),
                                  child: Text("Confirm"))
                            ],
                          ))
                    ]))),
      ),
    );
  }
}
