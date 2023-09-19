import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';

class IncomeView extends StatefulWidget {
  final KtsBookingApi apiClient;
  int? id;
  final StreamController<void> showAdd;

  IncomeView.create(this.apiClient, this.showAdd, {Key? key})
      : super(key: key) {
    showAdd.add(false);
  }
  IncomeView.edit(this.apiClient, this.showAdd, this.id, {Key? key})
      : super(key: key) {
    showAdd.add(false);
  }

  @override
  State<IncomeView> createState() => _IncomeViewState();
}

class _IncomeViewState extends State<IncomeView> {
  final NumberFormat formatCurrency = NumberFormat.simpleCurrency();
  final dateFormatter = new DateFormat('dd/MM/yyyy');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController paymentAmountController = TextEditingController();
  final FocusNode paymentAmountFocusNode = FocusNode();

  DateTime? _paymentDate = null;
  final TextEditingController paymentDateController = TextEditingController();
  final FocusNode paymentDateFocusNode = FocusNode();

  final TextEditingController paymentDescirption = TextEditingController();
  final FocusNode paymentDescirptionFocusNode = FocusNode();

  PaymentMethod? selectedPaymentMethod;
  final FocusNode paymentMethodFocusNode = FocusNode();

  set paymentDate(DateTime? value) {
    _paymentDate = value;
    if (_paymentDate != null) {
      paymentDateController.text = dateFormatter.format(_paymentDate!);
    } else {
      paymentDateController.clear();
    }
    print("PaymentDate: ${_paymentDate!.toUtc()}");
    print(paymentDateController.text);
  }

  IncomeDto? income;

  @override
  void initState() {
    super.initState();
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountReadApi()
        .accountReadInitAccountIncome(incomeId: widget.id)
        .then((value) {
      if (value.data != null) {
        setState(() {
          income = value.data!.income;
          if (income != null) {
            _setIncome(income!);
          }

          paymentDescirptionFocusNode.requestFocus();
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) => {EasyLoading.dismiss()});
  }

  void _setIncome(IncomeDto exp) {
    paymentAmountController.text = exp.amount.toString();
    paymentDate = exp.paymentDateTime.toLocal();
    selectedPaymentMethod = exp.paymentMethod;
    paymentDescirption.text = exp.description ?? "";
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  Future save() async {
    if (income == null) {
      await create();
    } else {
      await update();
    }
  }

  Future create() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    EasyLoading.show(
      status: 'Creating income...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = CreateIncomeRequest((b) {
      b.amount = double.parse(paymentAmountController.text);
      b.description = paymentDescirption.text;
      b.paymentDateTime = _paymentDate!.toUtc();
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteCreateIncome(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Income added successfully",
          duration: Duration(seconds: 2));
      _back();
    }, onError: (error) {
      EasyLoading.dismiss();
    });
  }

  Future update() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    EasyLoading.show(
      status: 'Updating income...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = UpdateIncomeRequest((b) {
      b.id = widget.id;
      b.amount = double.parse(paymentAmountController.text);
      b.description = paymentDescirption.text;
      b.paymentDateTime = _paymentDate!.toUtc();
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteUpdateIncome(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Income updated successfully",
          duration: Duration(seconds: 2));

      _back();
    }, onError: (error) {
      EasyLoading.dismiss();
    });
  }

  Future delete() async {
    EasyLoading.show(
      status: 'Deleting income...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = DeleteIncomeRequest((b) {
      b.id = income!.id;
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteDeleteIncome(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Income record deleted successfully",
          duration: Duration(seconds: 2));
      _back();
    }, onError: (err) {
      EasyLoading.dismiss();
    });
  }

  _back() {
    GoRouter.of(context).pushReplacementNamed(KtsRoutingLinks.income);
  }

  _confirmDeletionDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: ThemeColors.darkGrey,
        title: const Text("Confirm",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        content: const Text(
          "Please confirm you would like to delete this income record?",
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
              delete();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NoInternetConnectionWarning(),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 12),
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
                                      onPressed: () => _back(),
                                    )),
                                Text(
                                  "Income",
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
                            income == null
                                ? "Add an income"
                                : "Update an income",
                            style: TextStyle(
                                color: ThemeColors.light,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          )),
                      Form(
                        key: formKey,
                        child: Column(children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            focusNode: paymentDescirptionFocusNode,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Income Description is required"),
                            ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Income Description', 'e.g. Daily Sales',
                                    suffixIcon: KtsCustomAppIcons.coins,
                                    showInfo: false),
                            autofillHints: const ["description"],
                            controller: paymentDescirption,
                            onEditingComplete: () {
                              paymentAmountFocusNode.requestFocus();
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            focusNode: paymentAmountFocusNode,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Income Amount is required"),
                            ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Income Amount', 'e.g. £32.50',
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
                                      suffixIcon:
                                          KtsCustomAppIcons.calendar_plus_o),
                              autofillHints: const ["payment date"],
                              controller: paymentDateController,
                              readOnly: true, // when true user cannot edit text
                              onTap: () async {
                                paymentDate = await showDatePicker(
                                  context: context,
                                  initialDate: _paymentDate ?? DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );

                                if (_paymentDate != null) {
                                  paymentMethodFocusNode.requestFocus();
                                }
                              }),
                          const SizedBox(height: 24),
                        ]),
                      ),
                    ],
                  ))),
                  SizedBox(height: 12),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                          style: KtsAppWidgetStyles.roundButtonStyle(
                              ThemeColors.lightPink, ThemeColors.darkText),
                          onPressed: () async => await save(),
                          child: Text(
                              income == null ? "Add Income" : "Save Income"))),
                  income == null
                      ? SizedBox()
                      : Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: TextButton(
                                  style: KtsAppWidgetStyles.roundButtonStyle(
                                      ThemeColors.lightPink,
                                      ThemeColors.darkText),
                                  onPressed: () => _confirmDeletionDialog(),
                                  child: Text("Delete Income")))),
                ],
              )),
        )
      ],
    );
  }
}
