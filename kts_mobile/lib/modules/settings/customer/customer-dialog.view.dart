import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/validation-error-prompt/validation-error-prompt.dart';

class CustomerDialogView extends StatefulWidget {
  CustomerDto? customer;
  KtsBookingApi api;

  CustomerDialogView(this.api, {Key? key, this.customer}) : super(key: key);

  @override
  State<CustomerDialogView> createState() => _CustomerDialogViewState();
}

class _CustomerDialogViewState extends State<CustomerDialogView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final TextEditingController mobileController = TextEditingController();
  final FocusNode mobileFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (widget.customer == null) {
      create();
    } else {
      update();
    }
  }

  create() {
    EasyLoading.show(
      status: 'Creating customer...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = CreateCustomerRequest((b) {
      b.name = nameController.text;
      b.mobileNumber = mobileController.text;
      b.email = emailController.text;
    });
    widget.api
        .getAccountWriteApi()
        .accountWriteCreateCustomer(request: request)
        .then((value) {
      EasyLoading.dismiss();
      Navigator.pop(context, CustomerDto(
        (b) {
          b.id = value.data!.id;
          b.name = nameController.text;
          b.mobileNumber = mobileController.text;
          b.email = emailController.text;
        },
      ));
    }, onError: (error) => _handleError(error));
  }

  update() {
    var request = UpdateCustomerRequest((b) {
      b.id = widget.customer!.id;
      b.name = nameController.text;
      b.mobileNumber = mobileController.text;
      b.email = emailController.text;
    });
    widget.api
        .getAccountWriteApi()
        .accountWriteUpdateCustomer(request: request)
        .then((value) {
      Navigator.pop(context, CustomerDto(
        (b) {
          b.id = value.data!.id;
          b.name = nameController.text;
          b.mobileNumber = mobileController.text;
          b.email = emailController.text;
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

    if (widget.customer != null) {
      nameController.text = widget.customer!.name ?? "";
      mobileController.text = widget.customer!.mobileNumber ?? "";
      emailController.text = widget.customer!.email ?? "";
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
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(
                            Icons.close,
                            color: ThemeColors.error,
                            size: 32,
                          )),
                      SizedBox(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18
                    ),
                    child: Text(
                      "Customer",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: ThemeColors.lightPink,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Text(
                      widget.customer == null
                          ? "Add a customer"
                          : "Update a customer",
                      style: TextStyle(
                          color: ThemeColors.light,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
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
                                      'Name', 'e.g. Carly Smith',
                                      //suffixIcon: KtsCustomAppIcons.coins,
                                      showInfo: false),
                              autofillHints: const [AutofillHints.name],
                              controller: nameController,
                              onEditingComplete: () {
                                mobileFocusNode.requestFocus();
                              },
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              focusNode: mobileFocusNode,
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'Mobile Number', 'e.g. 07589654123',
                                      //suffixIcon: KtsCustomAppIcons.coins,
                                      showInfo: false),
                              autofillHints: const [
                                AutofillHints.telephoneNumber
                              ],
                              controller: mobileController,
                              onEditingComplete: () {
                                emailFocusNode.requestFocus();
                              },
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              focusNode: emailFocusNode,
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'Email', 'e.g. carly.smith@gmail.com',
                                      //suffixIcon: KtsCustomAppIcons.coins,
                                      showInfo: false),
                              autofillHints: const [AutofillHints.email],
                              controller: emailController,
                              onEditingComplete: () {},
                            ),
                            const SizedBox(height: 24),
                            const SizedBox(height: 24),
                            TextButton(
                                style: KtsAppWidgetStyles.roundButtonStyle(
                                    ThemeColors.lightPink, ThemeColors.darkText,
                                    minSize: 30),
                                onPressed: () => confirm(),
                                child: Text("Save"))
                          ],
                        ),
                      ))
                ])),
      ),
    );
  }
}
