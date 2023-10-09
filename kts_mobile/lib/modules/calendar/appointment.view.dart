import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/forms/input-formatters/decimal_text_input_formatter.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/calendar/payment-dialog.view.dart';
import 'package:kts_mobile/modules/calendar/refund_dialog.view.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:kts_mobile/modules/settings/customer/customer-dialog.view.dart';
import 'package:kts_mobile/modules/settings/service/service-dialog.view.dart';

import '../../common/routing/kts_routing_links.dart';

class AppointmentView extends StatefulWidget {
  final KtsBookingApi apiClient;
  int? id;
  DateTime? proposedDateTime;
  final StreamController<void> showAdd;
  AppointmentView.create(this.apiClient, this.showAdd,
      {Key? key, this.proposedDateTime})
      : super(key: key) {
    this.showAdd.add(false);
  }
  AppointmentView.edit(this.apiClient, this.id, this.showAdd, {Key? key})
      : super(key: key) {
    this.showAdd.add(false);
  }

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController totalCostController = TextEditingController();
  final TextEditingController depositAmountCostController =
      TextEditingController();
  final TextEditingController appointmentDateController =
      TextEditingController();
  final TextEditingController appointmentStartTimeController =
      TextEditingController();
  final TextEditingController appointmentEndTimeController =
      TextEditingController();
  final TextEditingController refundAmountCostController =
      TextEditingController();
  final FocusNode paymentNotesFocusNode = FocusNode();
  final TextEditingController tipAmountController = TextEditingController();
  final FocusNode tipAmountFocusNode = FocusNode();
  final FocusNode expenseCategoryFocusNode = FocusNode();
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");
  final dateFormatter = new DateFormat('dd/MM/yyyy');

  CustomerDto? selectedCustomer;
  List<CustomerDto> customers = List<CustomerDto>.empty();
  ServiceDto? selectedService;
  List<ServiceDto> services = List<ServiceDto>.empty();
  AppointmentDto? appointment;
  List<IncomeDto> payments = List<IncomeDto>.empty(growable: true);
  List<IncomeDto> removedPayment = List<IncomeDto>.empty(growable: true);
  num remainingBalance = 0;
  var availableStartTimes = List<DateTime>.empty(growable: true);
  var availableEndTimes = List<DateTime>.empty(growable: true);
  DateTime? _selectedAppointmentDate;
  DateTime? get selectedAppointmentDate {
    return _selectedAppointmentDate;
  }

  void set selectedAppointmentDate(DateTime? dateTime) {
    _selectedAppointmentDate =
        new DateTime(dateTime!.year, dateTime.month, dateTime.day);
    appointmentDateController.text = _selectedAppointmentDate != null
        ? dateFormatter.format(_selectedAppointmentDate!)
        : "";
  }

  DateTime? _selectedAppointmentStartDateTime;
  DateTime? get selectedAppointmentStartDateTime {
    return _selectedAppointmentStartDateTime;
  }

  void set selectedAppointmentStartDateTime(DateTime? dateTime) {
    _selectedAppointmentStartDateTime = dateTime;
    appointmentStartTimeController.text =
        selectedAppointmentStartDateTime != null
            ? DateFormat("hh:mm a").format(selectedAppointmentStartDateTime!)
            : "";
    selectedAppointmentEndDateTime = null;
    _setEndTimes();
  }

  DateTime? _selectedAppointmentEndDateTime;
  DateTime? get selectedAppointmentEndDateTime {
    return _selectedAppointmentEndDateTime;
  }

  void set selectedAppointmentEndDateTime(DateTime? dateTime) {
    _selectedAppointmentEndDateTime = dateTime;
    appointmentEndTimeController.text = _selectedAppointmentEndDateTime != null
        ? DateFormat("hh:mm a").format(_selectedAppointmentEndDateTime!)
        : "";
  }

  List<AppointmentDto> selectedDayAppointments = List<AppointmentDto>.empty();
  List<DateTime> allDayMinSlots = List<DateTime>.empty(growable: true);

  FixedExtentScrollController startDateController =
      new FixedExtentScrollController();
  FixedExtentScrollController endDateController =
      new FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    //split the current day into 5 minute slots
    setState(() => {
          if (widget.id == null)
            {
              selectedAppointmentDate = widget.proposedDateTime != null
                  ? DateTime(
                      widget.proposedDateTime!.year,
                      widget.proposedDateTime!.month,
                      widget.proposedDateTime!.day,
                      8,
                      00
                    )
                  : DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day),
              loadAllDaySlots(),
              _loadSlots().then((value) {
                selectedAppointmentStartDateTime =
                    widget.proposedDateTime != null
                        ? widget.proposedDateTime!
                        : DateTime(DateTime.now().year, DateTime.now().month,
                            DateTime.now().day,8,00);
              })
            }
        });
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountReadApi()
        .accountReadInitAppointment(appointmentId: widget.id)
        .then((value) {
      if (value.data != null) {
        setState(() {
          customers = value.data!.customers!.toList();
          services = value.data!.services!.toList();
          appointment = value.data!.appointment;
          payments = value.data!.income!.toList();
          if (appointment != null) {
            depositAmountCostController.text = appointment!.deposit.toString();
            totalCostController.text = appointment!.cost.toString();
            tipAmountController.text=appointment!.tip.toString();
            selectedCustomer =
                customers.firstWhere((c) => c.id == appointment!.customer!.id);
            selectedService =
                services.firstWhere((c) => c.id == appointment!.services!.id);
            selectedAppointmentDate = DateTime(
                appointment!.startDateTime.toLocal().year,
                appointment!.startDateTime.toLocal().month,
                appointment!.startDateTime.toLocal().day,8,00);
            loadAllDaySlots();
            _loadSlots().then((value) {
              selectedAppointmentStartDateTime =
                  appointment!.startDateTime.toLocal();
              selectedAppointmentEndDateTime =
                  appointment!.endDateTime.toLocal();
            });

            _calculateBalance();
          }
          EasyLoading.dismiss();
        });
      }
    }, onError: (err) => {EasyLoading.dismiss()});

    totalCostController.addListener(() {
      setState(() {
        _calculateBalance();
      });
    });
  }

  // void loadAllDaySlots() {
  //   allDayMinSlots = List<DateTime>.empty(growable: true);
  //   var counter = Duration();
  //   while (counter < Duration(hours: 24)) {
  //     allDayMinSlots.add(DateTime(selectedAppointmentDate!.year,
  //             selectedAppointmentDate!.month, selectedAppointmentDate!.day)
  //         .add(counter));
  //     counter = Duration(minutes: counter.inMinutes + 5);
  //   }
  // }
  void loadAllDaySlots() {
  allDayMinSlots = List<DateTime>.empty(growable: true);
  var initialTime = DateTime(selectedAppointmentDate!.year,
      selectedAppointmentDate!.month, selectedAppointmentDate!.day, 8, 00);

  var counter = Duration();
  while (counter < Duration(hours: 24)) {  // Change this to generate slots for 16 hours starting from 8am
    allDayMinSlots.add(initialTime.add(counter));
    counter = Duration(minutes: counter.inMinutes + 5);
  }
}

  _serviceChange() {
    totalCostController.text = selectedService!.totalPrice.toString();
    depositAmountCostController.text =
        selectedService!.depositType == DepositType.fixed
            ? selectedService!.deposit.toStringAsFixed(2)
            : ((selectedService!.totalPrice / 100) * selectedService!.deposit)
                .toStringAsFixed(2);

    if (selectedService!.defaultAppointmentDuration != 0 &&
        selectedService!.defaultAppointmentDuration != null &&
        selectedAppointmentStartDateTime != null) {
      var proposedEndTime = selectedAppointmentStartDateTime!.add(
          new Duration(minutes: selectedService!.defaultAppointmentDuration!));
      selectedAppointmentEndDateTime =
          availableEndTimes.firstWhereOrNull((et) => et == proposedEndTime);
    }
  }

  Future _loadSlots() async {
    return widget.apiClient
        .getAccountReadApi()
        .accountReadGetAppointments(
            start: selectedAppointmentDate!.toUtc(),
            end: selectedAppointmentDate!
                .add(Duration(days: 1))
                .sub(Duration(minutes: 1))
                .toUtc())
        .then((value) {
      availableStartTimes.clear();
      //show slots that are free
      if (value.data != null &&
          value.data!.appointments != null &&
          value.data!.appointments!.length > 0) {
        selectedDayAppointments = value.data!.appointments!.toList();

        for (var i = 0; i < allDayMinSlots.length; i++) {
          var overlap = selectedDayAppointments
              .where((a) =>
                  a.id != widget.id &&
                  (allDayMinSlots[i] == a.startDateTime.toLocal() ||
                      (allDayMinSlots[i] > a.startDateTime.toLocal() &&
                          allDayMinSlots[i] < a.endDateTime.toLocal())))
              .toList();

          if (overlap.length == 0) {
            availableStartTimes.add(allDayMinSlots[i]);
          }
        }
      } else {
        for (var i = 0; i < allDayMinSlots.length; i++) {
          availableStartTimes.add(allDayMinSlots[i]);
        }
      }
    }, onError: (error) {
      var t = error;
    });
  }

  _setEndTimes() {
    if (selectedAppointmentStartDateTime == null) {
      return;
    }
    availableEndTimes.clear();
    DateTime? lastSlotAdded;
    for (var i = 0; i < allDayMinSlots.length; i++) {
      if (allDayMinSlots[i] <= selectedAppointmentStartDateTime!) {
        continue;
      }
      var overlap = selectedDayAppointments
          .where((a) =>
              a.id != widget.id &&
              (allDayMinSlots[i] > a.startDateTime.toLocal() &&
                  allDayMinSlots[i] < a.endDateTime.toLocal()))
          .toList();

      if (overlap.length == 0) {
        if (lastSlotAdded != null) {
          var mins = allDayMinSlots[i].differenceInMinutes(lastSlotAdded);
          if (mins <= 5) {
            availableEndTimes.add(allDayMinSlots[i]);
            lastSlotAdded = allDayMinSlots[i];
          } else {
            break;
          }
        } else {
          availableEndTimes.add(allDayMinSlots[i]);
          lastSlotAdded = allDayMinSlots[i];
        }
      }
    }
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  Future save() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (appointment != null) {
      update();
    } else {
      create();
    }
  }

  Future create() async {
    EasyLoading.show(
      status: 'Creating appointment...',
      maskType: EasyLoadingMaskType.black,
    );
    var request = CreateAppointmentRequest((b) {
      b.cost = num.parse(totalCostController.text);
      b.customerId = selectedCustomer!.id;
      b.depositAmount = num.parse(depositAmountCostController.text);
      b.endDateTime = selectedAppointmentEndDateTime!.utc;
      b.startDateTime = selectedAppointmentStartDateTime!.utc;
      b.serviceId = selectedService!.id;
      b.tip = int.parse(tipAmountController.text);
      b.payments = ListBuilder<Payment>(this.payments.map((p) => Payment((pb) {
            pb.amount = p.amount;
            pb.paymentDateTime = p.paymentDateTime.utc;
            pb.paymentMethod = p.paymentMethod;
          })));
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteCreateAppointment(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Apppointment scheduled successfully",
          duration: Duration(seconds: 2));
      GoRouter.of(context).pushReplacementNamed(KtsRoutingLinks.calendar,
          queryParams: {
            'initalDateTime': this.selectedAppointmentStartDateTime.toString()
          });
    }, onError: (error) {
      EasyLoading.dismiss();
    });
  }

  Future update() async {
    EasyLoading.show(
      status: 'Updating appointment...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = UpdateAppointmentRequest((b) {
      b.id = appointment!.id;
      b.cost = num.parse(totalCostController.text);
      b.tip=int.parse(tipAmountController.text);
      b.customerId = selectedCustomer!.id;
      b.depositAmount = num.parse(depositAmountCostController.text);
      b.endDateTime = selectedAppointmentEndDateTime!.utc;
      b.startDateTime = selectedAppointmentStartDateTime!.utc;
      b.serviceId = selectedService!.id;
      b.addPayments = ListBuilder<Payment2>(
          this.payments.where((p) => p.id == 0).map((p) => Payment2((pb) {
                pb.amount = p.amount;
                pb.paymentDateTime = p.paymentDateTime.utc;
                pb.paymentMethod = p.paymentMethod;
              })));
      b.removePayments = ListBuilder<int>(this.removedPayment.map((e) => e.id));
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteUpdateAppointment(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Apppointment updated successfully",
          duration: Duration(seconds: 2));
      GoRouter.of(context).pushReplacementNamed(KtsRoutingLinks.calendar,
          queryParams: {
            'initalDateTime': this.selectedAppointmentStartDateTime.toString()
          });
    }, onError: (error) {
      EasyLoading.dismiss();
    });
  }

  Future<void> _paymentDialogBuilder(BuildContext context) {
    return showDialog<IncomeDto>(
      context: context,
      builder: (BuildContext context) {
        return PaymentDialogView();
      },
    ).then((value) {
      if (value != null) {
        payments.add(value);
        setState(() {
          _calculateBalance();
        });
      }
    });
  }

  Future<void> _refundDialogBuilder(BuildContext context) {
    return showDialog<IncomeDto>(
      context: context,
      builder: (BuildContext context) {
        return RefundDialogView();
      },
    ).then((value) {
      if (value != null) {
        payments.add(value);
        setState(() {
          _calculateBalance();
        });
      }
    });
  }

  Future<void> _customerDialogBuilder(BuildContext context) {
    return showDialog<CustomerDto>(
      context: context,
      builder: (BuildContext context) {
        return CustomerDialogView(widget.apiClient);
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          customers.add(value);
          customers.sort(
              (a, b) => (b.name ?? "").toLowerCase().compareTo(a.name ?? ""));
          selectedCustomer = value;
        });
      }
    });
  }

  Future<void> _serviceDialogBuilder(BuildContext context) {
    return showDialog<ServiceDto>(
      context: context,
      builder: (BuildContext context) {
        return ServiceDialogView(widget.apiClient);
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          services.add(value);
          services.sort(
              (a, b) => (b.name ?? "").toLowerCase().compareTo(a.name ?? ""));
          selectedService = value;
          _serviceChange();
        });
      }
    });
  }

  _calculateBalance() {
    remainingBalance = num.parse(
            (totalCostController.text == "" ? "0" : totalCostController.text)) -
        (payments.length == 0
            ? 0
            : payments.map((e) => e.amount).reduce((a, b) => a + b));
  }

  _confirmDeletionDialog(IncomeDto payment) {
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
          "Please confirm you would like to delete the payment?",
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
              delete(payment);
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

  Future delete(IncomeDto payment) async {
    setState(() {
      payments.remove(payment);
      if (payment.id != 0) {
        removedPayment.add(payment);
      }
      _calculateBalance();
    });
  }

  _confirmCancelationDialog() {
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
          "Please confirm you would like to cancel this appointment?",
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
              cancel();
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: ThemeColors.darkPink),
            ),
          )
        ],
      ),
    );
  }

  Future cancel() async {
    EasyLoading.show(
      status: 'Canceling appointment...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = CancelAppointmentRequest((b) {
      b.id = appointment!.id;
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteCancelAppointment(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Appointment cancelled successfully",
          duration: Duration(seconds: 2));
      GoRouter.of(context).pushReplacementNamed(KtsRoutingLinks.calendar,
          queryParams: {
            'initalDateTime': this.selectedAppointmentStartDateTime.toString()
          });
    }, onError: (err) {
      EasyLoading.dismiss();
    });
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
                      Row(
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
                                    onPressed: () => GoRouter.of(context)
                                        .pushReplacementNamed(
                                            KtsRoutingLinks.calendar))),
                            Text(
                              "Appointment",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: ThemeColors.lightPink,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                      Padding(
                          padding:
                              EdgeInsets.only(top: 12, bottom: 12, left: 12),
                          child: Text(
                            appointment == null
                                ? "Add an appointment"
                                : "Update an appointment",
                            style: TextStyle(
                                color: ThemeColors.light,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          )),
                      Form(
                        key: formKey,
                        child: Column(children: [
                          DropdownButtonFormField<CustomerDto?>(
                            value: selectedCustomer,
                            icon: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: const Icon(
                                    Icons.arrow_drop_down_circle_outlined)),
                            isExpanded: true,
                            elevation: 16,
                            iconEnabledColor: ThemeColors.darkPink,
                            dropdownColor: ThemeColors.darkGrey,
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration: InputDecoration(
                                labelText: "Customer",
                                labelStyle: const TextStyle(
                                    color: ThemeColors.light,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColors.light, width: 2.0),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3.0,
                                    color: ThemeColors.darkPink,
                                  ),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3.0,
                                    color: ThemeColors.error,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                    color: ThemeColors.error,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                                hintText: "e.g. Karen Armstrong",
                                hintStyle: const TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    color: ThemeColors.grey10,
                                    fontWeight: FontWeight.w400),
                                suffixIconConstraints:
                                    BoxConstraints(minWidth: 0),
                                suffixIcon: SizedBox(
                                    width: 24,
                                    child: IconButton(
                                      padding: EdgeInsets.only(top: 16),
                                      icon: const Icon(
                                        KtsCustomAppIcons.add_circle_outline,
                                        color: ThemeColors.darkPink,
                                      ),
                                      tooltip: 'Add',
                                      onPressed: () {
                                        _customerDialogBuilder(context);
                                      },
                                    ))),
                            onChanged: (CustomerDto? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                selectedCustomer = value!;
                                /*if (selectedExpenseCategory != null) {
                                  paymentMethodFocusNode.requestFocus();
                                }*/
                              });
                            },
                            validator: (value) => selectedCustomer == null
                                ? "Customer is required"
                                : null,
                            items: customers.map<DropdownMenuItem<CustomerDto>>(
                                (CustomerDto value) {
                              return DropdownMenuItem<CustomerDto>(
                                value: value,
                                child: Text(value.name ?? "-"),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 24),
                          DropdownButtonFormField<ServiceDto?>(
                            value: selectedService,
                            icon: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: const Icon(
                                    Icons.arrow_drop_down_circle_outlined)),
                            isExpanded: true,
                            elevation: 16,
                            iconEnabledColor: ThemeColors.darkPink,
                            dropdownColor: ThemeColors.darkGrey,
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration: InputDecoration(
                                labelText: "Service",
                                labelStyle: const TextStyle(
                                    color: ThemeColors.light,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColors.light, width: 2.0),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3.0,
                                    color: ThemeColors.darkPink,
                                  ),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3.0,
                                    color: ThemeColors.error,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                    color: ThemeColors.error,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                                hintText: "e.g. Nails",
                                hintStyle: const TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    color: ThemeColors.grey10,
                                    fontWeight: FontWeight.w400),
                                suffixIconConstraints:
                                    BoxConstraints(minWidth: 0),
                                suffixIcon: SizedBox(
                                    width: 24,
                                    child: IconButton(
                                      padding: EdgeInsets.only(top: 16),
                                      icon: const Icon(
                                        KtsCustomAppIcons.add_circle_outline,
                                        color: ThemeColors.darkPink,
                                      ),
                                      tooltip: 'Add',
                                      onPressed: () {
                                        _serviceDialogBuilder(context);
                                      },
                                    ))),
                            onChanged: (ServiceDto? value) {
                              setState(() {
                                selectedService = value!;
                                _serviceChange();
                              });
                            },
                            validator: (value) => selectedService == null
                                ? "e.g. Eye Brow Threading"
                                : null,
                            items: services.map<DropdownMenuItem<ServiceDto>>(
                                (ServiceDto value) {
                              return DropdownMenuItem<ServiceDto>(
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
                              //focusNode: paymentDateFocusNode,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Appointment Date is required"),
                              ]),
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'Date', 'e.g. Monday 24th July 2023',
                                      suffixIcon:
                                          KtsCustomAppIcons.calendar_plus_o),
                              autofillHints: const ["payment date"],
                              controller: appointmentDateController,
                              readOnly: true, // when true user cannot edit text
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: selectedAppointmentDate ??
                                        DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2099));
                                if (date != null &&
                                    selectedAppointmentDate != date) {
                                  selectedAppointmentDate = date;
                                  selectedAppointmentStartDateTime = null;
                                  selectedAppointmentEndDateTime = null;
                                  loadAllDaySlots();
                                  _loadSlots();
                                }
                              }),
                          const SizedBox(height: 24),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              //focusNode: paymentDateFocusNode,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Start time is required"),
                              ]),
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'Start Time', 'e.g. 11.00AM',
                                      suffixIcon: KtsCustomAppIcons.clock),
                              autofillHints: const ["payment date"],
                              controller: appointmentStartTimeController,
                              readOnly: true, // when true user cannot edit text
                              onTap: () async {
                               if (availableStartTimes.isNotEmpty) {
    var item = availableStartTimes.firstWhere(
      (ast) => ast == selectedAppointmentStartDateTime,
      orElse: () => availableStartTimes.first, // Set a default value when no matching element is found
    );

    startDateController = FixedExtentScrollController(
      initialItem: availableStartTimes.indexOf(item),
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 250,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: ThemeColors.darkGrey,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoPicker(
                scrollController: startDateController,
                itemExtent: 50,
                onSelectedItemChanged: (index) {
                  selectedAppointmentStartDateTime = availableStartTimes[index];
                },
                children: availableStartTimes
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          DateFormat('hh:mm a').format(e),
                          style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 18,
                            fontFamily: KtsAppWidgetStyles.fontFamily,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            TextButton(
              style: KtsAppWidgetStyles.roundButtonStyle(
                ThemeColors.lightPink,
                ThemeColors.darkText,
                minSize: 25,
                minWidth: 0.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Confirm"),
            )
          ],
        ),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Available Start Times'),
          content: Text('No available start times found for the selected date.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Set a default start time of 8am
                selectedAppointmentStartDateTime = DateTime(
                  selectedAppointmentDate!.year,
                  selectedAppointmentDate!.month,
                  selectedAppointmentDate!.day,
                  8,
                  0,
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
                              }
                              ),
                          const SizedBox(height: 24),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              //focusNode: paymentDateFocusNode,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "End time is required"),
                              ]),
                              style: KtsAppWidgetStyles.fieldTextStyle(),
                              decoration:
                                  KtsAppWidgetStyles.fieldInputDdecoration(
                                      'End Time', 'e.g. 12.00PM',
                                      suffixIcon: KtsCustomAppIcons.clock),
                              autofillHints: const ["payment date"],
                              controller: appointmentEndTimeController,
                              readOnly: true, // when true user cannot edit text
                              onTap: () async {
                                if (selectedAppointmentEndDateTime == null &&
                                    availableEndTimes.length > 0) {
                                  selectedAppointmentEndDateTime =
                                      availableEndTimes[0];
                                }
                                showCupertinoModalPopup<void>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Container(
                                          height: 250,
                                          padding:
                                              const EdgeInsets.only(top: 6.0),
                                          margin: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom,
                                          ),
                                          color: ThemeColors.darkGrey,
                                          child: Column(children: [
                                            SizedBox(
                                                height: 180,
                                                child: CupertinoPicker(
                                                    itemExtent: 50,
                                                    onSelectedItemChanged:
                                                        (index) {
                                                      selectedAppointmentEndDateTime =
                                                          availableEndTimes[
                                                              index];
                                                    },
                                                    children: availableEndTimes
                                                        .map((e) => Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            child: Text(
                                                                style: TextStyle(
                                                                    color: ThemeColors
                                                                        .light,
                                                                    fontSize:
                                                                        18,
                                                                    fontFamily:
                                                                        KtsAppWidgetStyles
                                                                            .fontFamily),
                                                                DateFormat(
                                                                        'hh:mm a')
                                                                    .format(
                                                                        e))))
                                                        .toList())),
                                            TextButton(
                                                style: KtsAppWidgetStyles
                                                    .roundButtonStyle(
                                                        ThemeColors.lightPink,
                                                        ThemeColors.darkText,
                                                        minSize: 25,
                                                        minWidth: 0.0),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Confirm"))
                                          ]),
                                        ));
                              }),
                          const SizedBox(height: 24),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            //focusNode: paymentAmountFocusNode,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Total Cost is required"),
                            ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Total Cost', 'e.g. £12.99',
                                    suffixIcon: KtsCustomAppIcons.coins,
                                    showInfo: false),
                            autofillHints: const [AutofillHints.name],
                            controller: totalCostController,
                            inputFormatters: <TextInputFormatter>[
                              DecimalTextInputFormatter(2)
                            ],
                            onEditingComplete: () {
                              //paymentDateFocusNode.requestFocus();
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            //focusNode: paymentAmountFocusNode,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Deposit Amount is required"),
                            ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Deposit Amount', 'e.g. £5.00',
                                    suffixIcon: KtsCustomAppIcons.coins,
                                    showInfo: false),
                            autofillHints: const [AutofillHints.name],
                            controller: depositAmountCostController,
                            inputFormatters: <TextInputFormatter>[
                              DecimalTextInputFormatter(2)
                            ],
                            onEditingComplete: () {
                              //paymentDateFocusNode.requestFocus();
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            focusNode: tipAmountFocusNode,
                            textCapitalization: TextCapitalization.words,
                            // validator: MultiValidator([
                            //   RequiredValidator(
                            //       errorText: "Tip Amount is required"),
                            // ]),
                            style: KtsAppWidgetStyles.fieldTextStyle(),
                            decoration:
                                KtsAppWidgetStyles.fieldInputDdecoration(
                                    'Tip', 'e.g. £32.50',
                                    suffixIcon: KtsCustomAppIcons.coins,
                                    showInfo: false),
                            autofillHints: const [AutofillHints.name],
                            controller: tipAmountController,
                            inputFormatters: <TextInputFormatter>[
                              DecimalTextInputFormatter(2)
                            ],
                            onEditingComplete: () {
                              tipAmountFocusNode.requestFocus();
                            },
                          ),
                          const SizedBox(height: 24),
                          payments.length > 0
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        "Payments",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: ThemeColors.lightPink,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      )))
                              : SizedBox(),
                          payments.length > 0
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        "Payments made for this appointment",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: ThemeColors.light,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      )))
                              : SizedBox(),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              itemCount: payments.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    onTap: (() {}),
                                    title: (Padding(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: ThemeColors.darkGrey),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 16,
                                                  right: 20,
                                                  bottom: 16),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "£${currencyFormatter.format(payments[index].amount)}",
                                                            style: const TextStyle(
                                                                color: ThemeColors
                                                                    .darkPink,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        Text(
                                                            dateFormatter.format(
                                                                payments[index]
                                                                    .paymentDateTime
                                                                    .toLocal()),
                                                            style: const TextStyle(
                                                                color:
                                                                    ThemeColors
                                                                        .light,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300))
                                                      ],
                                                    )),
                                                    const SizedBox(width: 12),
                                                    IconButton(
                                                        onPressed: () {
                                                          _confirmDeletionDialog(
                                                              payments[index]);
                                                        },
                                                        icon: Icon(
                                                          Icons.close,
                                                          color:
                                                              ThemeColors.error,
                                                        ))
                                                  ])),
                                        ))));
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () =>
                                      _paymentDialogBuilder(context),
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 6),
                                          child: Icon(
                                            size: 20,
                                            KtsCustomAppIcons
                                                .add_circle_outline,
                                            color: ThemeColors.darkPink,
                                          )),
                                      Text(
                                        "Add Payment",
                                        style: TextStyle(
                                            color: ThemeColors.darkPink,
                                            fontSize: 13,
                                            fontFamily:
                                                KtsAppWidgetStyles.fontFamily,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )),
                              appointment != null
                                  ? TextButton(
                                      onPressed: () =>
                                          _refundDialogBuilder(context),
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Icon(
                                                size: 20,
                                                KtsCustomAppIcons
                                                    .add_circle_outline,
                                                color: ThemeColors.darkPink,
                                              )),
                                          Text(
                                            "Redfund Payment",
                                            style: TextStyle(
                                                color: ThemeColors.darkPink,
                                                fontSize: 13,
                                                fontFamily: KtsAppWidgetStyles
                                                    .fontFamily,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ))
                                  : SizedBox(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Text(
                                    "Balance: ",
                                    style: TextStyle(
                                        color: ThemeColors.light,
                                        fontFamily:
                                            KtsAppWidgetStyles.fontFamily,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "£${currencyFormatter.format(remainingBalance)}",
                                    style: TextStyle(
                                        color: ThemeColors.light,
                                        fontFamily:
                                            KtsAppWidgetStyles.fontFamily,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                              ),
                            ],
                          ),
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
                          child: Text(appointment == null
                              ? "Add Appointment"
                              : "Save Appointment"))),
                  SizedBox(height: appointment != null ? 12 : 0),
                  appointment != null
                      ? Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                              style: KtsAppWidgetStyles.roundButtonStyle(
                                  ThemeColors.lightPink, ThemeColors.darkText),
                              onPressed: () {
                                _confirmCancelationDialog();
                              },
                              child: Text("Cancel Appointment")))
                      : SizedBox(),
                ],
              )),
        )
      ],
    );
  }
}
