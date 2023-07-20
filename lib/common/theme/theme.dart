import 'package:flutter/material.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';

class KtsTheme extends Theme {
  static ThemeData themeData = ThemeData(
      fontFamily: 'Montserrat',
      unselectedWidgetColor: ThemeColors.light,
      scaffoldBackgroundColor: ThemeColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.appBarBackground,
        centerTitle: true,
        iconTheme: IconThemeData(color: ThemeColors.lightPink),
      ),
      colorScheme: ColorScheme.light(
        primary: ThemeColors.darkPink, // header background color
        onPrimary: ThemeColors.light, // header text color
        onSurface: ThemeColors.darkText, // body text color
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ThemeColors.darkText, // button text color
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            MaterialStateColor.resolveWith((states) => ThemeColors.darkPink),
        splashRadius: 30,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ThemeColors.darkPink,
          foregroundColor: ThemeColors.light,
          elevation: 5),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ThemeColors.darkPink,
        unselectedLabelStyle: TextStyle(fontSize: 11),
        selectedLabelStyle: TextStyle(fontSize: 11),
        backgroundColor: Color.fromARGB(10, 0, 0, 0),
      ));

  KtsTheme(Widget child) : super(child: child, data: themeData);
}
