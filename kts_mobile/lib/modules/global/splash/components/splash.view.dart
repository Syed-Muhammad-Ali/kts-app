import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/splash/splash-screen-background.png"),
          fit: BoxFit.cover,
        )),
        child: Align(
            child: Column(
          children: [
            Expanded(
                child: Container(
              child: SafeArea(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                          child: SvgPicture.asset(
                            'images/kts-logo.svg',
                          )))),
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                      stops: [
                    .3,
                    1
                  ])),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          color: ThemeColors.lightPink,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontFamily: KtsAppWidgetStyles.fontFamily),
                    ),
                    Text(
                      "KTS Book Keeping App",
                      style: TextStyle(
                          color: ThemeColors.lightPink,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                          fontFamily: KtsAppWidgetStyles.fontFamily),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 12, left: 12, right: 12, bottom: 12),
                        child: TextButton(
                            style: KtsAppWidgetStyles.roundButtonStyle(
                                ThemeColors.lightPink, ThemeColors.darkText),
                            onPressed: () =>
                                context.goNamed(KtsRoutingLinks.signup),
                            child: Text("SIGN UP"))),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 12,
                            right: 12,
                            bottom: MediaQuery.of(context).size.height * 0.04),
                        child: GestureDetector(
                            onTap: () => context.goNamed(KtsRoutingLinks.login),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      style: TextStyle(
                                          fontFamily:
                                              KtsAppWidgetStyles.fontFamily,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: ThemeColors.darkPink),
                                      "Already have an account?"),
                                  Text(
                                      style: TextStyle(
                                          fontFamily:
                                              KtsAppWidgetStyles.fontFamily,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.darkPink),
                                      " Sign In..")
                                ])))
                  ]),
            )),
          ],
        )));
  }
}
