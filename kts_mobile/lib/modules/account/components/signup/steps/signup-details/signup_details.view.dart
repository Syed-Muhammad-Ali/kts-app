import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:intl/intl.dart';
import 'package:kts_mobile/modules/global/info-prompt/info-prompt.dart';
import 'package:kts_mobile/modules/global/info-prompts.dart';
import 'package:kts_mobile/modules/settings/address/address-dialog.dart';

class SignupDetailsView extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(SignupDetailsFormData) onSave;

  final SignupDetailsFormData? data;
  final StreamController? backStream;
  final String title;

  // inject a stream which emits when the back button is pressed
  // inject the title and subtitle
  // always show the back button and emit when the back button is pressed

  const SignupDetailsView(
      this.formKey, this.onSave, this.backStream, this.title,
      {Key? key, this.data})
      : super(key: key);

  @override
  State<SignupDetailsView> createState() => _SignupDetailsViewState();
}

class _SignupDetailsViewState extends State<SignupDetailsView> {
  final emailTextController = TextEditingController();
  final emailFocusNode = new FocusNode();

  final nameTextController = TextEditingController();
  final nameFocusNode = new FocusNode();

  Country? _selectCountryOfResidence;
  final countryOfResidenceFocusNode = new FocusNode();

  DateTime? _selectedDob = DateTime.now();
  final dobTextController = TextEditingController();
  final dobFocusNode = new FocusNode();

  final addresssTextController = TextEditingController();
  final addressFocusNode = new FocusNode();

  final ninoTextController = TextEditingController();
  final ninoFocusNode = new FocusNode();

  final utrTextController = TextEditingController();
  final utrFocusNode = new FocusNode();

  DateTime? get selectedDob {
    return _selectedDob;
  }

  set selectedDob(DateTime? value) {
    _selectedDob = value;
    if (_selectedDob != null) {
      dobTextController.text = DateFormat.yMMMMd().format(_selectedDob!);
    } else {
      dobTextController.clear();
    }
  }

  AddressDto? _address;

  set address(AddressDto? add) {
    _address = add;
  }

  AddressDto? get address {
    return _address;
  }

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      emailTextController.text = widget.data!.email;
      nameTextController.text = widget.data!.name;
      if (widget.data!.dob != null) {
        selectedDob = widget.data!.dob!.toLocal();
      }

      if (widget.data!.address != null) {
        _setAddress(widget.data!.address!);
      }

      _selectCountryOfResidence = widget.data!.country;

      emailTextController.text = widget.data!.email;
      ninoTextController.text = widget.data!.nino;
      utrTextController.text = widget.data!.utr;
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    nameTextController.dispose();
    addresssTextController.dispose();
    ninoTextController.dispose();
    utrTextController.dispose();
    emailFocusNode.dispose();
    nameFocusNode.dispose();
    dobTextController.dispose();
    dobFocusNode.dispose();
    addressFocusNode.dispose();
    ninoFocusNode.dispose();
    utrFocusNode.dispose();
  }

  Future<void> _addressDialogBuilder(BuildContext context) {
    return showDialog<AddressDto>(
      context: context,
      builder: (BuildContext context) {
        return AddressDialogView(address: address);
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          _setAddress(value);
        });
      }
    });
  }

  void _setAddress(AddressDto add) {
    address = add;
    addresssTextController.text =
        "${add.addressLine1}${add.addressLine2 != null ? ', ' + add.addressLine2! : ''}${add.town != null ? ', ' + add.town! : ''}${add.county != null ? ', ' + add.county! : ''}${add.postcode != null ? ', ' + add.postcode! : ''}";
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
        Form(
          key: widget.formKey,
          child: Column(children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              focusNode: emailFocusNode,
              textCapitalization: TextCapitalization.none,
              validator: MultiValidator([
                RequiredValidator(errorText: "Email is required"),
                EmailValidator(errorText: "Invalid email address"),
              ]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                  'Email', 'Enter your email address',
                  suffixIcon: Icons.mail),
              autofillHints: const [AutofillHints.name],
              controller: emailTextController,
              onEditingComplete: () {
                nameFocusNode.requestFocus();
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              focusNode: nameFocusNode,
              textCapitalization: TextCapitalization.words,
              validator: MultiValidator([
                RequiredValidator(errorText: "Name is required"),
              ]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                  'Name', 'Enter your full name including any middle names',
                  suffixIcon: Icons.person, suffixIconSize: 24),
              autofillHints: const [AutofillHints.name],
              controller: nameTextController,
              onEditingComplete: () {
                countryOfResidenceFocusNode.requestFocus();
              },
            ),
            SizedBox(height: 30),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                focusNode: dobFocusNode,
                validator: MultiValidator([
                  //RequiredValidator(errorText: "Date of Birth is required"),
                ]),
                style: KtsAppWidgetStyles.fieldTextStyle(),
                decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                    'DOB', 'e.g. 17/04/1985',
                    suffixIcon: KtsCustomAppIcons.calendar_plus_o,
                    suffixIconSize: 18),
                autofillHints: const [AutofillHints.birthday],
                controller: dobTextController,
                readOnly: true, // when true user cannot edit text
                onTap: () async {
                  selectedDob = await showDatePicker(
                    context: context,
                    initialDate: selectedDob ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDob != null) {
                    addressFocusNode.requestFocus();
                  }
                }),
            SizedBox(height: 24),
            TextFormField(
              onTap: () {
                _addressDialogBuilder(context);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              focusNode: addressFocusNode,
              readOnly: true,
              textCapitalization: TextCapitalization.words,
              validator: MultiValidator([
                //RequiredValidator(errorText: "Address is required"),
              ]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration('Address',
                  'House or flat number, Street, Town or City & Postcode',
                  suffixIcon: KtsCustomAppIcons.location_on,
                  suffixIconSize: 22),
              autofillHints: const [AutofillHints.fullStreetAddress],
              controller: addresssTextController,
              minLines: 3,
              maxLines: 3,
              onEditingComplete: () {
                countryOfResidenceFocusNode.requestFocus();
              },
            ),
            SizedBox(height: 24),
            DropdownButtonFormField<Country>(
                value: _selectCountryOfResidence,
                focusNode: countryOfResidenceFocusNode,
                icon: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: const Icon(Icons.arrow_drop_down_circle_outlined)),
                isExpanded: true,
                elevation: 16,
                style: KtsAppWidgetStyles.fieldTextStyle(),
                dropdownColor: ThemeColors.darkGrey,
                iconEnabledColor: ThemeColors.darkPink,
                decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                    'Country of Residence', 'e.g. Scotland'),
                onChanged: (Country? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _selectCountryOfResidence = value!;
                    if (_selectCountryOfResidence != null) {
                      ninoFocusNode.requestFocus();
                    }
                  });
                },
                validator: (value) => _selectCountryOfResidence == null
                    ? "Country of residence is required"
                    : null,
                items: [
                  DropdownMenuItem<Country>(
                    value: Country.englandAndNorthernIreland,
                    child: Text("England & Northern Ireland"),
                  ),
                  DropdownMenuItem<Country>(
                    value: Country.scotland,
                    child: Text(
                      "Scotland",
                    ),
                  ),
                  DropdownMenuItem<Country>(
                    value: Country.wales,
                    child: Text(
                      "Wales",
                    ),
                  ),
                ]),
            SizedBox(height: 30),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              focusNode: ninoFocusNode,
              textCapitalization: TextCapitalization.characters,
              validator: MultiValidator([
                //RequiredValidator(errorText: "Nino is required"),
                MaxLengthValidator(9,
                    errorText: "Nino must be 9 or less characters")
              ]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                  'National Insurence Number (NINO)', 'e.g. HJ/55/12/89/T',
                  suffixIcon: KtsCustomAppIcons.address_card,
                  suffixIconSize: 17),
              autofillHints: const [AutofillHints.name],
              controller: ninoTextController,
              onEditingComplete: () {
                utrFocusNode.requestFocus();
              },
            ),
            SizedBox(height: 24),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              focusNode: utrFocusNode,
              textCapitalization: TextCapitalization.characters,
              validator: MultiValidator([
                //RequiredValidator(errorText: "UTR is required"),
              ]),
              style: KtsAppWidgetStyles.fieldTextStyle(),
              decoration: KtsAppWidgetStyles.fieldInputDdecoration(
                  'Unique Tax Payer Reference (UTR)', 'e.g. 3639259138',
                  suffixIcon: KtsCustomAppIcons.money_bill_wave_alt,
                  suffixIconSize: 17,
                  showInfo: true, showInfoCalback: () {
                _showInfoDialog(InfoPromptConstants.urtText);
              }),
              autofillHints: const [AutofillHints.name],
              controller: utrTextController,
              onSaved: (newValue) {
                widget.onSave(SignupDetailsFormData(
                    emailTextController.text,
                    nameTextController.text,
                    _selectCountryOfResidence!,
                    selectedDob,
                    address,
                    ninoTextController.text,
                    utrTextController.text));
              },
            ),
          ]),
        ),
      ],
    );
  }
}

class SignupDetailsFormData {
  final String email;
  final String name;
  final Country country;
  final DateTime? dob;
  final AddressDto? address;
  final String nino;
  final String utr;
  SignupDetailsFormData(this.email, this.name, this.country, this.dob,
      this.address, this.nino, this.utr);
}
