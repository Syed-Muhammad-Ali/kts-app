import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:intl/intl.dart';
import 'package:kts_mobile/modules/global/validation-error-prompt/validation-error-prompt.dart';

class ServiceDialogView extends StatefulWidget {
  ServiceDto? service;
  KtsBookingApi api;

  ServiceDialogView(this.api, {Key? key, this.service}) : super(key: key);

  @override
  State<ServiceDialogView> createState() => _ServiceDialogViewState();
}

class _ServiceDialogViewState extends State<ServiceDialogView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final TextEditingController totalPriceController = TextEditingController();
  final FocusNode totalPriceFocusNode = FocusNode();
  final TextEditingController depositController = TextEditingController();
  final TextEditingController defaultMinuiteController =
      TextEditingController();
  final FocusNode depositFocusNode = FocusNode();
  final FocusNode depositTypeFocusNode = FocusNode();
  final FocusNode defaultDurationFocusNode = FocusNode();

  DepositType? selectedDepositType;

  confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (widget.service == null) {
      create();
    } else {
      update();
    }
  }

  create() {
    EasyLoading.show(
      status: 'Creating service...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = CreateServiceRequest((b) {
      b.name = nameController.text;
      b.totalPrice = num.parse(totalPriceController.text);
      b.depositType = selectedDepositType;
      b.deposit = num.parse(depositController.text);
      b.defaultAppointmentDuration = defaultMinuiteController.text != ""
          ? int.parse(defaultMinuiteController.text)
          : null;
    });
    widget.api
        .getAccountWriteApi()
        .accountWriteCreateService(request: request)
        .then((value) {
      EasyLoading.dismiss();
      Navigator.pop(context, ServiceDto(
        (b) {
          b.id = value.data!.id;
          b.name = nameController.text;
          b.totalPrice = num.parse(totalPriceController.text);
          b.deposit = num.parse(depositController.text);
          b.depositType = selectedDepositType;
          b.defaultAppointmentDuration = defaultMinuiteController.text != ""
              ? int.parse(defaultMinuiteController.text)
              : null;
        },
      ));
    }, onError: (error) => _handleError(error));
  }

  update() {
    var request = UpdateServiceRequest((b) {
      b.id = widget.service!.id;
      b.name = nameController.text;
      b.totalPrice = int.parse(totalPriceController.text);
      b.depositType = selectedDepositType;
      b.deposit = int.parse(depositController.text);
      b.defaultAppointmentDuration = defaultMinuiteController.text != ""
          ? int.parse(defaultMinuiteController.text)
          : null;
    });
    widget.api
        .getAccountWriteApi()
        .accountWriteUpdateService(request: request)
        .then((value) {
      Navigator.pop(context, ServiceDto(
        (b) {
          b.id = value.data!.id;
          b.name = nameController.text;
          b.totalPrice = int.parse(totalPriceController.text);
          b.deposit = int.parse(depositController.text);
          b.depositType = selectedDepositType;
          b.defaultAppointmentDuration = defaultMinuiteController.text != ""
              ? int.parse(defaultMinuiteController.text)
              : null;
        },
      ));
    }, onError: (error) => _handleError(error));
  }

  _handleError(dynamic error) {
    if (error is DioError) {
      if (error.response!.statusCode == 400) {
        var errs = error.response!.data["errors"] as List<dynamic>;
        if (errs.length > 0) {
          _showValidationErrorDialog(errs, "Unable to save");
        }
      }
    }
    EasyLoading.dismiss();
  }

  _showValidationErrorDialog(List<dynamic> errors, String title) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            ValidationErrorPrompt(title, errors));
  }

  @override
  void initState() {
    super.initState();

    nameFocusNode.requestFocus();

    if (widget.service != null) {
      nameController.text = widget.service!.name ?? "";
      totalPriceController.text = (widget.service!.totalPrice).toString();
      selectedDepositType = widget.service!.depositType;
      depositController.text = (widget.service!.deposit).toString();
      defaultMinuiteController.text =
          widget.service!.defaultAppointmentDuration != null
              ? widget.service!.defaultAppointmentDuration.toString()
              : "";
    }
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
                        "Service",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: ThemeColors.lightPink,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.service == null
                            ? "Add a service"
                            : "Update a service",
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
                                focusNode: nameFocusNode,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Name is required"),
                                ]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Name', 'e.g. Infills',
                                        showInfo: false),
                                autofillHints: const [AutofillHints.name],
                                controller: nameController,
                                onEditingComplete: () {
                                  totalPriceFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                focusNode: totalPriceFocusNode,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Total Price is required"),
                                ]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Total Price', 'e.g. £50.00',
                                        suffixIcon: KtsCustomAppIcons.coins,
                                        showInfo: false),
                                autofillHints: const ["total price"],
                                controller: totalPriceController,
                                inputFormatters: <TextInputFormatter>[
                                  DecimalTextInputFormatter(2)
                                ],
                                onEditingComplete: () {
                                  depositTypeFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              DropdownButtonFormField<DepositType>(
                                  value: selectedDepositType,
                                  focusNode: depositTypeFocusNode,
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
                                          'Deposit Type', 'e.g. Percentage'),
                                  onChanged: (DepositType? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      selectedDepositType = value!;
                                    });
                                  },
                                  validator: (value) =>
                                      selectedDepositType == null
                                          ? "Deposit Type is required"
                                          : null,
                                  items: [
                                    DropdownMenuItem<DepositType>(
                                      value: DepositType.fixed,
                                      child: Text("Fixed Amount"),
                                    ),
                                    DropdownMenuItem<DepositType>(
                                      value: DepositType.percentage,
                                      child: Text(
                                        "Percentage of Total",
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
                                focusNode: depositFocusNode,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Deposit Amount is required"),
                                ]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Deposit Amount', 'e.g. £10.00 OR 10%',
                                        suffixIcon: KtsCustomAppIcons.coins,
                                        showInfo: false),
                                autofillHints: const ["deposit amount"],
                                controller: depositController,
                                inputFormatters: <TextInputFormatter>[
                                  DecimalTextInputFormatter(2)
                                ],
                                onEditingComplete: () {
                                  defaultDurationFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                focusNode: defaultDurationFocusNode,
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Default Appointment Duration (mins)',
                                        '180',
                                        suffixIcon: KtsCustomAppIcons.clock,
                                        showInfo: false),
                                autofillHints: const [
                                  "default appointment duration in minutes"
                                ],
                                controller: defaultMinuiteController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onEditingComplete: () {
                                  depositTypeFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextButton(
                                  style: KtsAppWidgetStyles.roundButtonStyle(
                                      ThemeColors.lightPink,
                                      ThemeColors.darkText,
                                      minSize: 30),
                                  onPressed: () => confirm(),
                                  child: Text("Save"))
                            ],
                          ))
                    ]))),
      ),
    );
  }
}
