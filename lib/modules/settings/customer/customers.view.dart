import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:kts_mobile/modules/settings/customer/customer-dialog.view.dart';

import '../../global/validation-error-prompt/validation-error-prompt.dart';

class CustomersView extends StatefulWidget {
  final KtsBookingApi apiClient;

  CustomersView(this.apiClient, {Key? key}) : super(key: key) {}

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');

  var customers = List<CustomerDto>.empty();
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();
  _CustomersViewState() {}

  @override
  void initState() {
    super.initState();

    EasyLoading.show(
      status: 'Loading customers...',
      maskType: EasyLoadingMaskType.black,
    );

    widget.apiClient.getAccountReadApi().accountReadInitCustomers().then(
        (value) {
      if (value.data != null) {
        setState(() {
          customers = (value.data!.customers ?? List<CustomerDto>.empty())
              .map((e) => e)
              .toList();
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) => {EasyLoading.dismiss()});
  }

  @override
  Future dispose() async {
    super.dispose();
    if (fabSubscription != null) {
      await fabSubscription!.cancel();
    }
    if (cancelToken != null) {
      cancelToken!.cancel();
    }
  }

  Future<void> _customerDialogBuilder(BuildContext context,
      {CustomerDto? customer = null}) {
    return showDialog<CustomerDto>(
      context: context,
      builder: (BuildContext context) {
        return CustomerDialogView(widget.apiClient, customer: customer);
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          if (customer != null) {
            customers.remove(customer);
          }
          customers.add(value);
          customers.sort(
              (a, b) => (a.name ?? "").toLowerCase().compareTo(b.name ?? ""));
        });
      }
    });
  }

  _confirmDeletionDialog(CustomerDto customer) {
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
          "Please confirm you would like to delete the customer?",
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
              delete(customer);
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

  Future delete(CustomerDto customer) async {
    EasyLoading.show(
      status: 'Deleting customer...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = DeleteCustomerRequest((b) {
      b.id = customer!.id;
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteDeleteCustomer(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Customer deleted successfully",
          duration: Duration(seconds: 2));
      setState(() {
        customers.remove(customer);
      });
    }, onError: _handleError);
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
            child: ListView(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              onPressed: () => context.pop(),
                            )),
                        Text(
                          "Customers",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: ThemeColors.lightPink,
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      padding: EdgeInsets.all(6),
                                      icon: const Icon(Icons.add,
                                          size: 28, color: ThemeColors.light),
                                      tooltip: 'Add',
                                      onPressed: () {
                                        _customerDialogBuilder(context);
                                      },
                                    ))))
                      ]),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
                      child: Text(
                        "Manage your customers",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: customers.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            onTap: (() {
                              _customerDialogBuilder(context,
                                  customer: customers[index]);
                            }),
                            title: (Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: ThemeColors.darkGrey),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          top: 12,
                                          right: 12,
                                          bottom: 12),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              customers[index].name ?? "-",
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: ThemeColors.darkPink,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  _confirmDeletionDialog(
                                                      customers[index]);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: ThemeColors.error,
                                                ))
                                          ])),
                                ))));
                      }),
                ],
              ))
        ])),
      ],
    );
  }
}
