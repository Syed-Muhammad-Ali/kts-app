import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class AddressDialogView extends StatefulWidget {
  AddressDto? address;

  AddressDialogView({Key? key, this.address}) : super(key: key);

  @override
  State<AddressDialogView> createState() => _AddressDialogViewState();
}

class _AddressDialogViewState extends State<AddressDialogView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController addressLine1Controller = TextEditingController();
  final FocusNode addressLine1FocusNode = FocusNode();
  final TextEditingController addressLine2Controller = TextEditingController();
  final FocusNode addressLine2FocusNode = FocusNode();
  final TextEditingController townController = TextEditingController();
  final FocusNode townFocusNode = FocusNode();
  final TextEditingController countyController = TextEditingController();
  final FocusNode countyFocusNode = FocusNode();
  final TextEditingController postcodeController = TextEditingController();
  final FocusNode postcodeFocusNode = FocusNode();

  confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (widget.address == null) {
      create();
    } else {
      update();
    }
  }

  create() {
    Navigator.pop(context, AddressDto(
      (b) {
        b.addressLine1 = addressLine1Controller.text;
        b.addressLine2 = addressLine2Controller.text;
        b.town = townController.text;
        b.county = countyController.text;
        b.postcode = postcodeController.text;
        b.country = Country.englandAndNorthernIreland;
      },
    ));
  }

  update() {
    Navigator.pop(context, AddressDto(
      (b) {
        b.addressLine1 = addressLine1Controller.text;
        b.addressLine2 = addressLine2Controller.text;
        b.town = townController.text;
        b.county = countyController.text;
        b.postcode = postcodeController.text;
        b.country = Country.englandAndNorthernIreland;
      },
    ));
  }

  @override
  void initState() {
    super.initState();

    if (widget.address != null) {
      addressLine1Controller.text = widget.address!.addressLine1 ?? "";
      addressLine2Controller.text = widget.address!.addressLine2 ?? "";
      countyController.text = widget.address!.county ?? "";
      townController.text = widget.address!.town ?? "";
      postcodeController.text = widget.address!.postcode ?? "";
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
                        "Address",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: ThemeColors.lightPink,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Enter your address",
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
                                focusNode: addressLine1FocusNode,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.streetAddress,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Address line 1 is required"),
                                ]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Address Line 1',
                                        'e.g. Clervaux Exchange',
                                        showInfo: false),
                                autofillHints: const [
                                  AutofillHints.streetAddressLevel1
                                ],
                                controller: addressLine1Controller,
                                onEditingComplete: () {
                                  addressLine2FocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                focusNode: addressLine2FocusNode,
                                keyboardType: TextInputType.streetAddress,
                                textCapitalization: TextCapitalization.words,
                                validator: MultiValidator([]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Address Line 2',
                                        'e.g.  Clervaux Terrace',
                                        showInfo: false),
                                autofillHints: const [
                                  AutofillHints.streetAddressLevel2
                                ],
                                controller: addressLine2Controller,
                                onEditingComplete: () {
                                  townFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                focusNode: townFocusNode,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.streetAddress,
                                validator: MultiValidator([]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Town', 'e.g. Jarrow',
                                        showInfo: false),
                                autofillHints: const [
                                  AutofillHints.addressCity
                                ],
                                controller: townController,
                                onEditingComplete: () {
                                  countyFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                focusNode: countyFocusNode,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.streetAddress,
                                validator: MultiValidator([]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'County', 'e.g. South Tyneside',
                                        showInfo: false),
                                autofillHints: const [
                                  AutofillHints.addressState
                                ],
                                controller: countyController,
                                onEditingComplete: () {
                                  postcodeFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.done,
                                focusNode: postcodeFocusNode,
                                keyboardType: TextInputType.streetAddress,
                                textCapitalization:
                                    TextCapitalization.characters,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Postcode is required"),
                                ]),
                                style: KtsAppWidgetStyles.fieldTextStyle(),
                                decoration:
                                    KtsAppWidgetStyles.fieldInputDdecoration(
                                        'Postcode', 'e.g. NE32 5UP',
                                        showInfo: false),
                                autofillHints: const [
                                  AutofillHints.postalAddress
                                ],
                                controller: postcodeController,
                                onEditingComplete: () {},
                              ),
                              const SizedBox(height: 24),
                              TextButton(
                                  style: KtsAppWidgetStyles.roundButtonStyle(
                                      ThemeColors.lightPink,
                                      ThemeColors.darkText,
                                      minSize: 30),
                                  onPressed: () => confirm(),
                                  child: Text(
                                      widget.address == null ? "Add" : "Save"))
                            ],
                          ))
                    ]))),
      ),
    );
  }
}
