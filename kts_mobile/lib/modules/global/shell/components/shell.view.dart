import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/app.service.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/modules/global/kts-bottom-navigation-bar/components/kts-bottom_navigation-bar.dart';
import 'dart:async';

import 'package:kts_mobile/modules/settings/settings.view.dart';

class Shell extends StatefulWidget {
  const Shell(
      {Key? key,
      required this.child,
      required this.addStream,
      required this.toggleAddStream,
      required this.apiClient})
      : super(key: key);
  final Widget child;
  final StreamController<void> addStream;
  final Stream<bool> toggleAddStream;
  final KtsBookingApi apiClient;
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  bool showAdd = true;
  StreamSubscription<void>? showAddSubscription = null;

  String? userName;
  bool hideBottomNav = false;
  bool toggleBodyBehindAppBar = false;

  num notificationCount = 0;

  @override
  void initState() {
    super.initState();
    showAddSubscription = widget.toggleAddStream.listen((value) {
      setState(() {
        showAdd = value;
      });
    });

    userName = AppService().loggedInAccount!.name;

    widget.apiClient
        .getAccountReadApi()
        .accountReadGetAccountNotifications()
        .then((value) {
      if (value.data != null && value.data!.notifications != null) {
        setState(() {
          notificationCount = value.data!.notifications!.length;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (showAddSubscription != null) {
      showAddSubscription!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: hideBottomNav ? null : KtsBottomNavigationBar(),
      extendBody: true,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          actions: [
            showAdd
                ? SizedBox(
                    width: 40,
                    child: IconButton(
                      padding: EdgeInsets.all(6),
                      icon: const Icon(Icons.add,
                          size: 28, color: ThemeColors.light),
                      tooltip: 'Add',
                      onPressed: () {
                        widget.addStream.add(null);
                      },
                    ))
                : SizedBox(),
            SizedBox(
                width: 40,
                child: IconButton(
                  padding: EdgeInsets.all(6),
                  icon: const Icon(Icons.settings_outlined,
                      size: 24, color: ThemeColors.light),
                  tooltip: 'View settings',
                  onPressed: () {
                    context.goNamed(KtsRoutingLinks.settings);
                  },
                )),
            SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  padding: EdgeInsets.all(6),
                  icon: Icon(Icons.notifications_active_outlined,
                      color: notificationCount == 0
                          ? ThemeColors.light
                          : ThemeColors.darkPink,
                      size: 26),
                  tooltip: 'View Notifications',
                  onPressed: () {
                    context.goNamed(KtsRoutingLinks.notifications);
                  },
                ))
          ],
          leadingWidth: 0,
          titleSpacing: 6,
          leading: SizedBox(width: 0),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 0, right: 12),
                    child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeColors.darkPink,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: ThemeColors.darkGrey,
                            image: DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: Svg('images/kts-logo.svg',
                                    size: Size(22, 22)),)))),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Hello, ${userName!.split(' ')[0]},",
                          style: TextStyle(
                              color: ThemeColors.darkPink,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text("Welcome Back",
                          style: TextStyle(
                              color: ThemeColors.darkPink,
                              fontSize: 18,
                              fontWeight: FontWeight.w600))
                    ])
              ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
