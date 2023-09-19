import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'app.dart';
import 'common/config/kts_environment.dart';

List<AppointmentDto> totalAppointment=[];
void main() async {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: KtsEnvironment.development,
  );

  KtsEnvironment().initConfig(environment);

  await initializeDateFormatting('en_GB', null);

  runApp(const KtsApp());
  _configLoading();
  await _configureRevenueCat();
}

void _configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = ThemeColors.lightPink
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

Future _configureRevenueCat() async {
  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration configuration;
  if (Platform.isAndroid) {
    configuration =
        PurchasesConfiguration(KtsEnvironment().config.androidSdkKey);
  } else {
    configuration = PurchasesConfiguration(KtsEnvironment().config.iosSdkKey);
  }
  await Purchases.configure(configuration);
}
