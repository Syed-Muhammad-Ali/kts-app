import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';

import 'kts-bottom-navigation-bar-item/kts-bottom_navigation-bar-item.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class KtsBottomNavigationBar extends StatefulWidget {
  KtsBottomNavigationBar({Key? key}) : super(key: key);
  final List<KtsBottomNavigationBarItem> bottomNavItems = [
    KtsBottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            'images/icons/calendar_icon.svg',
            height: 24,
          )),
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            'images/icons/calendar_icon.svg',
            height: 24,
            color: ThemeColors.darkPink,
          )),
      initialLocation: "/calendar",
      label: "Calendar",
    ),
    KtsBottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            'images/icons/expenses_icon.svg',
            height: 24,
          )),
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            'images/icons/expenses_icon.svg',
            height: 24,
            color: ThemeColors.darkPink,
          )),
      initialLocation: "/expenses-breakdown",
      label: "Expenses",
    ),
    KtsBottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            'images/icons/overview_icon.svg',
            height: 24,
          )),
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            'images/icons/overview_icon.svg',
            height: 24,
            color: ThemeColors.darkPink,
          )),
      initialLocation: "/overview",
      label: "Overview",
    ),
    KtsBottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: SvgPicture.asset(
            'images/icons/pound_sign_icon.svg',
            height: 32,
          )),
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: SvgPicture.asset(
            'images/icons/pound_sign_icon.svg',
            height: 32,
            color: ThemeColors.darkPink,
          )),
      initialLocation: "/income",
      label: "Income",
    ),
    KtsBottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 8, top: 6),
          child: SvgPicture.asset(
            'images/icons/summaries_icon.svg',
            height: 18,
          )),
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 8, top: 6),
          child: SvgPicture.asset(
            'images/icons/summaries_icon.svg',
            height: 19,
            color: ThemeColors.darkPink,
          )),
      initialLocation: "/summaries",
      label: "Summaries",
    ),
  ];

  @override
  State<KtsBottomNavigationBar> createState() => _KtsBottomNavigationBarState();
}

class _KtsBottomNavigationBarState extends State<KtsBottomNavigationBar> {
  int _locationToTabIndex(String location) {
    final index = widget.bottomNavItems
        .indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    // Only navigate if the tab index has changed
    if (tabIndex != _currentIndex) {
      context.go(widget.bottomNavItems[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22), topRight: Radius.circular(22))),
        child: Padding(
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              items: widget.bottomNavItems,
              selectedItemColor: ThemeColors.darkPink,
              onTap: (index) => _onItemTapped(context, index),
            )));
  }
}
