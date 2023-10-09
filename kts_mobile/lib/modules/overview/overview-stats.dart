import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class OverviewStats extends StatelessWidget {
  OverviewStats(this.stats, this.isForecasted, {Key? key}) : super(key: key);
  final currencyFormatter = new NumberFormat("#,##0.00", "en_GB");
  final AccountingPeriodOverviewStats stats;
  final bool isForecasted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var topLeftSize = constraints.biggest.width * .34;
      var topLeftX = constraints.biggest.width * 0.08;
      var topLeftY = constraints.biggest.height * 0.06;

      var topCenterSize = constraints.biggest.width * .09;
      var topCenterX = constraints.biggest.width * 0.52;
      var topCenterY = constraints.biggest.height * 0.1;

      var topRightSize = constraints.biggest.width * .22;
      var topRightX = (constraints.biggest.width * 0.90) - (topRightSize);
      var topRightY = constraints.biggest.height * 0.1;

      var centerLeftSize = constraints.biggest.width * .12;
      var centerLeftX = constraints.biggest.width * 0.05;
      var centerLeftY = constraints.biggest.height * 0.55;

      var centerSize = constraints.biggest.width * 0.60;
      var centerX = (constraints.biggest.width * 0.5) - (centerSize / 2);
      var centerY = (constraints.biggest.height * 0.5) - (centerSize / 2);

      var bottomLeftSize = constraints.biggest.width * .37;
      var bottomLeftX = constraints.biggest.width * 0.08;
      var bottomLeftY =
          (constraints.biggest.height * .83) - (bottomLeftSize / 2);

      var bottomCenterSize = constraints.biggest.width * .09;
      var bottomCenterX = constraints.biggest.width * 0.56 - bottomCenterSize;
      var bottomCenterY = constraints.biggest.height * 0.9 - bottomCenterSize;

      var bottomRightSize = constraints.biggest.width * .35;
      var bottomRightX = constraints.biggest.width * 0.95 - bottomRightSize;
      var bottomRightY =
          constraints.biggest.height * 0.82 - (bottomRightSize / 2);

      return Stack(
        children: <Widget>[
          //Glow top left
          Transform.translate(
              offset: Offset(topLeftX, topLeftY),
              child: Container(
                  width: topLeftSize,
                  height: topLeftSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFd591ad).withAlpha(100),
                          blurRadius: 40.0,
                          spreadRadius: 10.0,
                          offset: Offset(
                            10.0,
                            15.0,
                          ),
                        ),
                      ]))),
          //Top Left
          Transform.translate(
              offset: Offset(topLeftX, topLeftY),
              child: Container(
                  width: topLeftSize,
                  height: topLeftSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(centerSize),
                      image: DecorationImage(
                        image:
                            AssetImage('images/overview/bubble_top_left.png'),
                        fit: BoxFit.fitHeight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFFFFF).withAlpha(30),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        )
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isForecasted ?  "Tax and NI for year" : "Tax and NI",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                        Text(
                            "£${currencyFormatter.format(stats.taxLiability + stats.nic)}",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w800)),
                      ]))),

          //Top Right Glow
          Transform.translate(
              offset: Offset(topRightX, topRightY),
              child: Container(
                  width: topRightSize,
                  height: topRightSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd591ad).withAlpha(90),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: Offset(
                            12,
                            10,
                          ),
                        ),
                      ]))),

          //Top Right
          Transform.translate(
              offset: Offset(topRightX, topRightY),
              child: Container(
                  width: topRightSize,
                  height: topRightSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Svg('images/overview/elipse_top_right.svg'),
                    fit: BoxFit.cover,
                  )))),

          //Glow Top Center
          Transform.translate(
              offset: Offset(topCenterX, topCenterY),
              child: Container(
                  width: topCenterSize,
                  height: topCenterSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd591ad).withAlpha(50),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(
                            0,
                            0,
                          ),
                        ),
                      ]))),

          //Top Center
          Transform.translate(
              offset: Offset(topCenterX, topCenterY),
              child: Container(
                  width: topCenterSize,
                  height: topCenterSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Svg('images/overview/elipse_top.svg'),
                    fit: BoxFit.cover,
                  )))),

          //Glow center
          Transform.translate(
              offset: Offset(centerX, centerY),
              child: Container(
                  width: centerSize,
                  height: centerSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(centerSize),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd591ad).withAlpha(100),
                          blurRadius: 50.0,
                          spreadRadius: 30.0,
                          offset: Offset(
                            0,
                            0,
                          ),
                        ),
                      ]))),

          //Center
          Transform.translate(
              offset: Offset(centerX, centerY),
              child: Container(
                  width: centerSize,
                  height: centerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(centerSize),
                    image: DecorationImage(
                      isAntiAlias: true,
                      image: AssetImage('images/overview/bubble_center.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFFFFF).withAlpha(30),
                        blurRadius: 6.0,
                        spreadRadius: 6.0,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      ),
                    ],
                    //backgroundBlendMode: BlendMode.multiply
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isForecasted ?  "Profit for year" : "Current profit",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text("£${currencyFormatter.format(stats.profit)}",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 28,
                                fontWeight: FontWeight.w800)),
                      ]))),

          //Glow Left Center
          Transform.translate(
              offset: Offset(centerLeftX, centerLeftY),
              child: Container(
                  width: centerLeftSize,
                  height: centerLeftSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd591ad).withAlpha(80),
                          blurRadius: 20.0,
                          spreadRadius: 20.0,
                          offset: Offset(
                            0,
                            0,
                          ),
                        ),
                      ]))),
          //Left Center
          Transform.translate(
              offset: Offset(centerLeftX, centerLeftY),
              child: Container(
                  width: centerLeftSize,
                  height: centerLeftSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Svg('images/overview/elipse_left.svg'),
                    fit: BoxFit.cover,
                  )))),

          //Glow Bottom Left
          Transform.translate(
              offset: Offset(bottomLeftX, bottomLeftY),
              child: Container(
                  width: bottomLeftSize,
                  height: bottomLeftSize,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(bottomLeftSize * 0.84),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd591ad).withAlpha(90),
                          blurRadius: 20.0,
                          spreadRadius: 10.0,
                          offset: Offset(
                            10,
                            10,
                          ),
                        ),
                      ]))),

          //Bottom Left
          Transform.translate(
              offset: Offset(bottomLeftX, bottomLeftY),
              child: Container(
                  width: bottomLeftSize,
                  height: bottomLeftSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(centerSize),
                      image: DecorationImage(
                        image: AssetImage(
                            'images/overview/bubble_bottom_right.png'),
                        fit: BoxFit.fitHeight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFFFFF).withAlpha(30),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        )
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isForecasted ?  "Income for year" : "Current income" ,
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                        Text("£${currencyFormatter.format(stats.revenue)}",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w800)),
                      ]))),

          //Bottom Center
          Transform.translate(
              offset: Offset(bottomCenterX, bottomCenterY),
              child: Container(
                  width: bottomCenterSize,
                  height: bottomCenterSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Svg('images/overview/elipse_bottom.svg'),
                    fit: BoxFit.cover,
                  )))),

          //Glow Bottom Right
          Transform.translate(
              offset: Offset(bottomRightX, bottomRightY),
              child: Container(
                  width: bottomRightSize,
                  height: bottomRightSize,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(bottomRightSize * 0.84),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd591ad).withAlpha(90),
                          blurRadius: 20.0,
                          spreadRadius: 10.0,
                          offset: Offset(
                            10,
                            10,
                          ),
                        ),
                      ]))),
          //Bottom Right
          Transform.translate(
              offset: Offset(bottomRightX, bottomRightY),
              child: Container(
                  width: bottomRightSize,
                  height: bottomRightSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(centerSize),
                      image: DecorationImage(
                        image: AssetImage(
                            'images/overview/bubble_bottom_right.png'),
                        fit: BoxFit.fitHeight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFFFFF).withAlpha(30),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        )
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isForecasted ? "Expense for year" :"Current expenses" ,
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 11,
                                fontWeight: FontWeight.w500)),
                        Text("£${currencyFormatter.format(stats.expenses)}",
                            style: TextStyle(
                                color: ThemeColors.darkPink,
                                fontFamily: KtsAppWidgetStyles.fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                      ])))
        ],
      );
    });
  }
}
