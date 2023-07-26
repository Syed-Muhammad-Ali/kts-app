import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kts_mobile/common/identity/models/token.dart';
import 'package:kts_mobile/common/identity/services/token.provider.dart';
import 'package:kts_mobile/common/routing/kts_route_generator.dart';
import 'package:kts_mobile/common/theme/theme.dart';

class KtsApp extends StatelessWidget {
  const KtsApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Token?>(
        future: TokenProvider().getToken(),
        builder: (BuildContext context, AsyncSnapshot<Token?> snapshot) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: KtsRouteConfigurator.getConfig(snapshot.data != null),
            theme: KtsTheme.themeData,
            builder: EasyLoading.init(),
          );
        });
  }
}
