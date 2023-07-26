import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

class NotificationsView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final StreamController<void> showAdd;

  NotificationsView(this.apiClient, this.showAdd, {Key? key})
      : super(key: key) {}

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final dateFormatter = new DateFormat('dd/MM/yyyy');

  var notifications = List<NotificationDto>.empty();
  _NotificationsViewState() {}

  @override
  void initState() {
    super.initState();
    widget.showAdd.add(false);
    widget.apiClient
        .getAccountReadApi()
        .accountReadGetAccountNotifications()
        .then((value) {
      if (value.data != null && value.data!.notifications != null)
        setState(() {
          notifications = value.data!.notifications!.toList();
        });
    });
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  IconData getNotificationIcon(NotificationDto? notification) {
    if (notification is WelcomeNotificationDto) {
      return Icons.handshake_outlined;
    }
    return Icons.question_mark;
  }

  _setRead(NotificationDto notification) {
    var request = SetNotificationRequest((b) {
      b.id = notification.id;
    });
    EasyLoading.show(
      status: 'Updating notification...',
      maskType: EasyLoadingMaskType.black,
    );
    widget.apiClient
        .getAccountWriteApi()
        .accountWriteSetNotificationRead(request: request)
        .then((value) {
      setState(() {
        notifications.remove(notification);
        EasyLoading.dismiss();
      });
    }, onError: (e) {
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
                        fit: BoxFit.cover)))),
        SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            onPressed: () =>
                                context.goNamed(KtsRoutingLinks.overview))),
                    Expanded(
                        child: Text(
                      "Notifications",
                      style: TextStyle(
                          color: ThemeColors.lightPink,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                      softWrap: true,
                    ))
                  ])),
          Padding(
              padding: EdgeInsets.only(top: 6, bottom: 12, left: 24),
              child: Text(
                "View your notifications",
                style: TextStyle(
                    color: ThemeColors.light,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: notifications.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: (Padding(
                            padding: EdgeInsets.only(bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: ThemeColors.darkGrey),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 30, right: 20, bottom: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(18)),
                                                color: ThemeColors.darkPink),
                                            child: Icon(getNotificationIcon(
                                                notifications[index]))),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              notifications[index].header ??
                                                  "-",
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: ThemeColors.darkPink,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            SizedBox(height: 12),
                                            Text(
                                                notifications[index].message ??
                                                    "-",
                                                style: const TextStyle(
                                                    color: ThemeColors.light,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12)),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: TextButton(
                                                    onPressed: () {
                                                      _setRead(
                                                          notifications[index]);
                                                    },
                                                    child: Text("Clear",
                                                        style: TextStyle(
                                                            color: ThemeColors
                                                                .darkPink,
                                                            fontFamily:
                                                                KtsAppWidgetStyles
                                                                    .fontFamily))))
                                          ],
                                        )),
                                      ])),
                            ))));
                  })),
        ]))
      ],
    );
  }
}
