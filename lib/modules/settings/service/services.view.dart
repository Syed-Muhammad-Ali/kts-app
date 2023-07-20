import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:kts_mobile/modules/global/validation-error-prompt/validation-error-prompt.dart';
import 'package:kts_mobile/modules/settings/service/service-dialog.view.dart';

class ServicesView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final Stream<void> fabStream;
  final StreamController<void> showAdd;

  ServicesView(this.apiClient, this.fabStream, this.showAdd, {Key? key})
      : super(key: key) {}

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');

  var services = List<ServiceDto>.empty();
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();
  _ServicesViewState() {}

  @override
  void initState() {
    super.initState();
    widget.showAdd.add(true);
    fabSubscription = widget.fabStream.listen((value) {
      _serviceDialogBuilder(context);
    });

    EasyLoading.show(
      status: 'Loading services...',
      maskType: EasyLoadingMaskType.black,
    );

    widget.apiClient.getAccountReadApi().accountReadInitServices().then(
        (value) {
      if (value.data != null) {
        setState(() {
          services = (value.data!.services ?? List<ServiceDto>.empty())
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

  Future<void> _serviceDialogBuilder(BuildContext context,
      {ServiceDto? service = null}) {
    return showDialog<ServiceDto>(
      context: context,
      builder: (BuildContext context) {
        return ServiceDialogView(widget.apiClient, service: service);
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          if (service != null) {
            services.remove(service);
          }
          services.add(value);
          services.sort(
              (a, b) => (a.name ?? "").toLowerCase().compareTo(b.name ?? ""));
        });
      }
    });
  }

  _confirmDeletionDialog(ServiceDto service) {
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
          "Please confirm you would like to delete the service?",
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
              delete(service);
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

  Future delete(ServiceDto service) async {
    EasyLoading.show(
      status: 'Deleting service...',
      maskType: EasyLoadingMaskType.black,
    );

    var request = DeleteServiceRequest((b) {
      b.id = service.id;
    });

    widget.apiClient
        .getAccountWriteApi()
        .accountWriteDeleteService(request: request)
        .then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Service deleted successfully",
          duration: Duration(seconds: 2));
      setState(() {
        services.remove(service);
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
                  Padding(
                      padding: EdgeInsets.only(bottom: 0),
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
                                  onPressed: () => context.pop(),
                                )),
                            Text(
                              "Services",
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
                                              size: 28,
                                              color: ThemeColors.light),
                                          tooltip: 'Add',
                                          onPressed: () {
                                            _serviceDialogBuilder(context);
                                          },
                                        ))))
                          ])),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
                      child: Text(
                        "Manage the services you offer",
                        style: TextStyle(
                            color: ThemeColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: services.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            onTap: (() {
                              _serviceDialogBuilder(context,
                                  service: services[index]);
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
                                              services[index].name ?? "-",
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
                                                      services[index]);
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
