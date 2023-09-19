// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/expenses/viewImage.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';

class ExpenseView extends StatefulWidget {
  final KtsBookingApi apiClient;
  int? id;
  int? categoryId;
  final StreamController<void> showAdd;

  ExpenseView.create(this.apiClient, this.showAdd, {Key? key, this.categoryId})
      : super(key: key) {
    showAdd.add(false);
  }
  ExpenseView.edit(this.apiClient, this.showAdd, this.id,
      {Key? key, this.categoryId})
      : super(key: key) {
    showAdd.add(false);
  }

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  final int imageQuality = 70;
  final double imageMaxWidth = 800;
  final NumberFormat formatCurrency = NumberFormat.simpleCurrency();
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController paymentAmountController = TextEditingController();
  final FocusNode paymentAmountFocusNode = FocusNode();
  DateTime? _paymentDate = null;
  final TextEditingController paymentDateController = TextEditingController();
  final FocusNode paymentDateFocusNode = FocusNode();
  bool isRecurringEnabled = false;
  String recurrence = '';
  DateTime? get paymentDate {
    return _paymentDate;
  }

  final dateFormatter = new DateFormat('dd/MM/yyyy');
  set paymentDate(DateTime? value) {
    _paymentDate = value;
    if (_paymentDate != null) {
      paymentDateController.text = dateFormatter.format(_paymentDate!);
    } else {
      paymentDateController.clear();
    }
  }

  final TextEditingController supplierController = TextEditingController();
  final FocusNode supplierFocusNode = FocusNode();
  final TextEditingController paymentNotesController = TextEditingController();
  final FocusNode paymentNotesFocusNode = FocusNode();
  final FocusNode expenseCategoryFocusNode = FocusNode();
  ExpenseCategoryDto? selectedExpenseCategory;
  List<ExpenseCategoryDto> expenseCategories = List<ExpenseCategoryDto>.empty();
  final FocusNode paymentMethodFocusNode = FocusNode();

  PaymentMethod? selectedPaymentMethod;
  XFile? file;
  ExpenseDto? expense;

  String? fileName;
  XFile? filePath;
  List<XFile> imageFileList = [];

  @override
  void initState() {
    super.initState();
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountReadApi()
        .accountReadInitAccountExpense(expenseId: widget.id)
        .then((value) {
      if (value.data != null) {
        setState(() {
          expenseCategories = (value.data!.expenseCategories ??
                  List<ExpenseCategoryDto>.empty())
              .map((ec) => ec)
              .toList();
          expense = value.data!.expense;
          if (expense != null) {
            _setExpense(expense!);
          }

          supplierFocusNode.requestFocus();

          if (widget.categoryId != null) {
            selectedExpenseCategory = expenseCategories
                .firstWhereOrNull((element) => element.id == widget.categoryId);
          }
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) => {EasyLoading.dismiss()});
  }

  void _setExpense(ExpenseDto exp) {
    paymentAmountController.text = exp.amount.toString();
    paymentDate = exp.paidDateTime.toLocal();
    if (exp.category != null) {
      if (expenseCategories.map((e) => e.id).contains(exp.category!.id)) {
        selectedExpenseCategory = expenseCategories
            .firstWhere((element) => element.id == exp.category!.id);
      }
    }
    selectedPaymentMethod = exp.paymentMethod;
    if (exp.receipt != null) {
      fileName = exp.receipt!.name;
    }
    paymentNotesController.text = exp.notes ?? "";
    supplierController.text = exp.supplier ?? "";
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  Future save() async {
    if (expense == null) {
      await create();
    } else {
      await update();
    }
  }

  Future create() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    int? recieptId;
    if (file != null) {
      EasyLoading.show(
        status: 'Uploading reciept...',
        maskType: EasyLoadingMaskType.black,
      );
      var bytes = await file!.readAsBytes();
      Response<UploadFileResponse> response = await widget.apiClient
          .getAccountWriteApi()
          .accountWriteUploadFile(
              formFile: MultipartFile.fromBytes(bytes, filename: file!.name));
      recieptId = response.data != null ? response.data!.id : null;
      print("accountWriteUploadFile : $response");
    }

    EasyLoading.show(
      status: 'Creating expense...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = CreateExpenseRequest((b) {
      b.supplier = supplierController.text;
      b.amount = double.parse(paymentAmountController.text);
      b.categoryId = selectedExpenseCategory!.id;
      b.notes = paymentNotesController.text;
      b.paidDateTime = paymentDate!.toUtc();
      b.paymentMethod = selectedPaymentMethod;
      if (recieptId != null) {
        b.recieptId = recieptId;
      }
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteCreateExpense(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Expense added successfully",
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

    int? recieptId = expense!.receipt != null ? expense!.receipt!.id : null;
    // if a file has been selected upload it and get the file id
    if (file != null) {
      EasyLoading.show(
        status: 'Uploading reciept...',
        maskType: EasyLoadingMaskType.black,
      );
      var bytes = await file!.readAsBytes();
      Response<UploadFileResponse> response = await widget.apiClient
          .getAccountWriteApi()
          .accountWriteUploadFile(
              formFile: MultipartFile.fromBytes(bytes, filename: file!.name));
      recieptId = response.data != null ? response.data!.id : null;
    }
    // if the expense had a recipt when loaded
    // but has now been removed set to null to delete it
    else if (expense!.receipt != null && fileName == null) {
      recieptId = null;
    }

    EasyLoading.show(
      status: 'Updating expense...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = UpdateExpenseRequest((b) {
      b.id = expense!.id;
      b.supplier = supplierController.text;
      b.amount = double.parse(paymentAmountController.text);
      b.categoryId = selectedExpenseCategory!.id;
      b.notes = paymentNotesController.text;
      b.paidDateTime = paymentDate!.toUtc();
      b.paymentMethod = selectedPaymentMethod;
      if (recieptId != null) {
        b.recieptId = recieptId;
      }
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteUpdateExpense(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Expense updated successfully",
          duration: Duration(seconds: 2));

      _back();
    }, onError: (error) {
      EasyLoading.dismiss();
    });
  }

  Future delete() async {
    EasyLoading.show(
      status: 'Deleting expense...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = DeleteExpenseRequest((b) {
      b.id = expense!.id;
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteDeleteExpense(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Expense deleted successfully",
          duration: Duration(seconds: 2));
      _back();
    }, onError: (err) {
      EasyLoading.dismiss();
    });
  }

  Future selectFile() async {
    file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
        maxWidth: imageMaxWidth);
    filePath = file;
     
    if (file != null) {
      setState(() {
        fileName = file!.name;
        file = filePath;
       imageFileList.add(file!);
      });
      print("fileName : $fileName");
    }
  }

Future<void> launchCamera() async {
  file = await _picker.pickImage(
    source: ImageSource.camera,
    imageQuality: imageQuality,
    maxWidth: imageMaxWidth,
  );

  if (file != null) {
    setState(() {
      fileName = file!.name;
      filePath = file; // Set filePath to the selected file
      imageFileList.add(file!);
    });
  }
}

  removeFile(int index) {
    setState(() {
      // file = null;
      // fileName = null;
       imageFileList.removeAt(index);
    });
  }
  void clearSelectedFiles() {
    setState(() {
      imageFileList.clear();
      fileName = null;
    });
  }

  _back() {
    if (widget.categoryId != null) {
      GoRouter.of(context)
          .pushReplacementNamed(KtsRoutingLinks.expenses, params: {
        'categoryId': widget.categoryId.toString(),
      });
    } else {
      GoRouter.of(context)
          .pushReplacementNamed(KtsRoutingLinks.expenses_breakdown);
    }
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
          "Please confirm you would like to delete the expense?",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "Expense",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: ThemeColors.lightPink,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                              ])),
                      Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(
                            expense == null
                                ? "Add an expense"
                                : "Update an expense",
                            style: TextStyle(
                                color: ThemeColors.light,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recurring Expense",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.light,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                          Switch(
                            value: isRecurringEnabled,
                            onChanged: (value) {
                              setState(() {
                                isRecurringEnabled = value;
                              });
                            },
                            activeTrackColor: ThemeColors.darkPink,
                            activeColor: ThemeColors.darkPink,
                            inactiveTrackColor: ThemeColors.grey10,
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isRecurringEnabled,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Radio(
                                  fillColor: MaterialStateProperty.all(
                                      recurrence == 'Weekly'
                                          ? ThemeColors.darkPink
                                          : ThemeColors.light),
                                  value: 'Weekly',
                                  groupValue: recurrence,
                                  onChanged: (value) {
                                    setState(() {
                                      recurrence = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Weekly',
                                  style: TextStyle(
                                    color: recurrence == 'Weekly'
                                        ? ThemeColors.lightPink
                                        : ThemeColors.light,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Radio(
                                  fillColor: MaterialStateProperty.all(
                                      recurrence == 'Fortnightly'
                                          ? ThemeColors.darkPink
                                          : ThemeColors.light),
                                  value: 'Fortnightly',
                                  groupValue: recurrence,
                                  onChanged: (value) {
                                    setState(() {
                                      recurrence = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Fortnightly',
                                  style: TextStyle(
                                    color: recurrence == 'Fortnightly'
                                        ? ThemeColors.lightPink
                                        : ThemeColors.light,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Radio(
                                  fillColor: MaterialStateProperty.all(
                                      recurrence == 'Monthly'
                                          ? ThemeColors.darkPink
                                          : ThemeColors.light),
                                  value: 'Monthly',
                                  groupValue: recurrence,
                                  onChanged: (value) {
                                    setState(() {
                                      recurrence = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Monthly',
                                  style: TextStyle(
                                    color: recurrence == 'Monthly'
                                        ? ThemeColors.lightPink
                                        : ThemeColors.light,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Radio(
                                  fillColor: MaterialStateProperty.all(
                                      recurrence == 'Quarterly'
                                          ? ThemeColors.darkPink
                                          : ThemeColors.light),
                                  value: 'Quarterly',
                                  groupValue: recurrence,
                                  onChanged: (value) {
                                    setState(() {
                                      recurrence = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Quarterly',
                                  style: TextStyle(
                                    color: recurrence == 'Quarterly'
                                        ? ThemeColors.lightPink
                                        : ThemeColors.light,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: formKey,
                        child: Column(children: [
                          DropdownButtonFormField<ExpenseCategoryDto?>(
                            value: selectedExpenseCategory,
                            icon: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: const Icon(
                                    Icons.arrow_drop_down_circle_outlined)),
                            isExpanded: true,
                            elevation: 16,
                            iconEnabledColor: ThemeColors.darkPink,
                            dropdownColor: ThemeColors.darkGrey,
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Payment Category', 'e.g. Food & Travel'),
                            onChanged: (ExpenseCategoryDto? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                selectedExpenseCategory = value!;
                                if (selectedExpenseCategory != null) {
                                  paymentMethodFocusNode.requestFocus();
                                }
                              });
                            },
                            validator: (value) =>
                                selectedExpenseCategory == null
                                    ? "Payment Category is required"
                                    : null,
                            items: expenseCategories
                                .map<DropdownMenuItem<ExpenseCategoryDto>>(
                                    (ExpenseCategoryDto value) {
                              return DropdownMenuItem<ExpenseCategoryDto>(
                                value: value,
                                child: Text(value.name ?? "-"),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            focusNode: supplierFocusNode,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Supplier is required"),
                            ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                                'Supplier',
                                selectedExpenseCategory != null
                                    ? 'e.g. ${selectedExpenseCategory!.placeHolderExampleText}'
                                    : "",
                                showInfo: false),
                            autofillHints: const [AutofillHints.name],
                            controller: supplierController,
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
                                  initialDate: paymentDate ?? DateTime.now(),
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
                                  child: const Icon(
                                      Icons.arrow_drop_down_circle_outlined)),
                              isExpanded: true,
                              elevation: 16,
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              dropdownColor: ThemeColors.darkGrey,
                              iconEnabledColor: ThemeColors.darkPink,
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'Payment Method', 'e.g. Debit Card'),
                              onChanged: (PaymentMethod? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  selectedPaymentMethod = value!;
                                  if (selectedExpenseCategory != null) {
                                    paymentNotesFocusNode.requestFocus();
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
                            focusNode: paymentNotesFocusNode,
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            maxLines: 3,
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Notes', ''),
                            autofillHints: const ["notes"],
                            controller: paymentNotesController,
                          ),
                          const SizedBox(height: 24),
                          // fileName != null
                          //     ?
                          //     :
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 80,
                                child: DottedBorder(
                                  color: ThemeColors.grey11,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(15),
                                  strokeWidth: 1,
                                  dashPattern: [6, 4],
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          child: Column(
                                            children: [
                                              Icon(
                                                  KtsCustomAppIcons.file_upload,
                                                  color: ThemeColors.grey11,
                                                  size: 24),
                                              SizedBox(height: 6),
                                              Text(
                                                "Attach a file",
                                                style: TextStyle(
                                                    color: ThemeColors.light,
                                                    fontFamily:
                                                        KtsAppWidgetStyles
                                                            .fontFamily,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          onPressed: () async {
                                            await selectFile();
                                          },
                                        )
                                      ]),
                                ),
                              )),
                              SizedBox(width: 8),
                              Expanded(
                                  child: Container(
                                height: 80,
                                child: DottedBorder(
                                  color: ThemeColors.grey11,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(15),
                                  strokeWidth: 1,
                                  dashPattern: [6, 4],
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          child: Column(
                                            children: [
                                               Icon(
                                                  KtsCustomAppIcons.file_upload,
                                                  color: ThemeColors.grey11,
                                                  size: 24),
                                              SizedBox(height: 6),
                                              Text(
                                                "OCR Scan",
                                                style: TextStyle(
                                                    color: ThemeColors.light,
                                                    fontFamily:
                                                        KtsAppWidgetStyles
                                                            .fontFamily,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          onPressed: () async {
                                            await launchCamera();
                                          },
                                        )
                                      ]),
                                ),
                              )),
                              SizedBox(width: 8),
                              Expanded(
                                  child: Container(
                                height: 80,
                                child: DottedBorder(
                                  color: ThemeColors.grey11,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(15),
                                  strokeWidth: 1,
                                  dashPattern: [6, 4],
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          child: Column(
                                            children: [
                                              Icon(
                                                  KtsCustomAppIcons.add_a_photo,
                                                  color: ThemeColors.grey11,
                                                  size: 28),
                                              SizedBox(height: 6),
                                              Text(
                                                "Take a photo",
                                                style: TextStyle(
                                                    color: ThemeColors.light,
                                                    fontFamily:
                                                        KtsAppWidgetStyles
                                                            .fontFamily,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          onPressed: () async {
                                            await launchCamera();
                                          },
                                        )
                                      ]),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 15),
                          fileName != null
                              ? Column(
                                  children: [
                                    Icon(KtsCustomAppIcons.file_upload,
                                        color: ThemeColors.darkPink, size: 24),
                                    SizedBox(height: 6),
                                   ListView.builder(
                                     physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              itemCount:imageFileList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                        return ListTile(
                                           contentPadding: EdgeInsets.all(0),
                                        onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ViewImageScreen(),
      settings: RouteSettings(arguments: {'path': imageFileList[index].path}),
    ),
  );
},

                                         title:Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: IconButton(
                                                          padding: EdgeInsets.all(0),
                                                          iconSize: 20,
                                                          onPressed: () => removeFile(index),
                                                          icon: Icon(Icons.close,
                                                              color: ThemeColors.error,
                                                              size: 20))),
                                                  Expanded(
                                                      // child: Image.file(File(imageFileList[index].path), fit: BoxFit.cover),
                                                      child: Text(
                                                   imageFileList[index].name,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: ThemeColors.light,
                                                      fontFamily:
                                                          KtsAppWidgetStyles.fontFamily,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  ),
                                                ]),
                                          ),
                                          
                                        );
                                      }
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          const SizedBox(height: 12),
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
                          child: Text(expense == null
                              ? "Add Expense"
                              : "Save Expense"))),
                  expense == null
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
                                  child: Text("Delete Expense")))),
                ],
              )),
        )
      ],
    );
  }
}
