import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';

class NoInternetConnectionWarning extends StatefulWidget {
  const NoInternetConnectionWarning({Key? key}) : super(key: key);

  @override
  State<NoInternetConnectionWarning> createState() =>
      _NoInternetConnectionWarningState();
}

class _NoInternetConnectionWarningState
    extends State<NoInternetConnectionWarning> {
  bool isOffline = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      if (result == ConnectivityResult.none) {
        isOffline = true;
      } else if (result == ConnectivityResult.mobile) {
        isOffline = false;
      } else if (result == ConnectivityResult.wifi) {
        isOffline = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isOffline == false
        ? PreferredSize(preferredSize: Size.fromHeight(0.0), child: SizedBox())
        : PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
                color: Color(0xFF171E21),
                child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: ThemeColors.darkPink,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("No internet connection available..",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ThemeColors.lightPink,
                                fontWeight: FontWeight.w300,
                                fontSize: 14))
                      ],
                    ))));
  }
}
