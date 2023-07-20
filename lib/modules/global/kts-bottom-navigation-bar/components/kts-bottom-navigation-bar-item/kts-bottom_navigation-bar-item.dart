import 'package:flutter/material.dart';

class KtsBottomNavigationBarItem extends BottomNavigationBarItem {
  const KtsBottomNavigationBarItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon);

  /// The initial location/path
  final String initialLocation;
}
