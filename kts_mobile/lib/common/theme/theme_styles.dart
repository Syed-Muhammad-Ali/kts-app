import 'package:flutter/material.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KtsAppWidgetStyles {
  static final KtsAppWidgetStyles _style = KtsAppWidgetStyles._internal();

  factory KtsAppWidgetStyles() {
    return _style;
  }

  KtsAppWidgetStyles._internal();

  // Font-Family
  static const String fontFamily = "Montserrat";

  // Button Styles
  static ButtonStyle roundButtonStyle(Color bgColor, Color fgColor,
      {double minSize = 50, double minWidth = double.infinity}) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        foregroundColor: MaterialStateProperty.all<Color>(fgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)))),
        minimumSize: MaterialStateProperty.all<Size>(Size(minWidth, minSize)),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontStyle: FontStyle.normal)));
  }

  // Form Inputs
  static InputDecoration fieldInputDdecoration(
      String labelText, String hintText,
      {IconData? suffixIcon,
      double suffixIconSize = 20,
      bool showInfo = false,
      IconData? prefixIcon,
      Function? showInfoCalback}) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            color: ThemeColors.light, fontFamily: fontFamily, fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.light, width: 2.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3.0,
            color: ThemeColors.darkPink,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3.0,
            color: ThemeColors.error,
          ),
        ),
        errorStyle: const TextStyle(
            color: ThemeColors.error,
            fontFamily: fontFamily,
            fontSize: 10,
            fontWeight: FontWeight.w300),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 12.0,
            fontFamily: fontFamily,
            color: ThemeColors.grey10,
            fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.only(bottom: 6),
        suffixIcon: suffixIcon != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _getIcons(
                    suffixIcon, suffixIconSize, showInfo, showInfoCalback),
              )
            : null,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null);
  }

  static TextStyle fieldTextStyle() {
    return TextStyle(
        color: ThemeColors.light, fontSize: 14, fontWeight: FontWeight.w300);
  }

  static TextStyle fieldTextStyleDark() {
    return TextStyle(
        color: ThemeColors.darkGrey, fontSize: 14, fontWeight: FontWeight.w300);
  }

  static List<Widget> _getIcons(IconData icon, double iconSize, bool showInfo,
      Function? showInfoCalback) {
    var icons = List<Widget>.empty(growable: true);
    if (showInfo) {
      icons.add(GestureDetector(
          onTap: () {
            if (showInfoCalback != null) {
              showInfoCalback();
            }
          },
          child: SvgPicture.asset(
            "images/icons/info_icon.svg",
            width: 18.00,
            height: 18.00,
          )));
      icons.add(Padding(
          padding: EdgeInsets.only(top: 8),
          child: Icon(
            icon,
            size: iconSize,
            color: ThemeColors.darkPink,
          )));
    } else {
      icons.add(Icon(icon, size: iconSize, color: ThemeColors.darkPink));
    }

    return icons;
  }

  static TextStyle calendarCurrentDayTextStyle() {
    return const TextStyle(
        fontSize: 13,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: ThemeColors.light);
  }

  static TextStyle calendarDayTextStyle() {
    return const TextStyle(
        fontSize: 13,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: ThemeColors.light50);
  }
}

class KtsCustomAppIcons {
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData search =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chart_bar =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chart =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData calendar_alt =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData th_list =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData add_a_photo =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData lock =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData location_on =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData person =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData add_circle_outline =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData clock =
      IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData access_alarms =
      IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData edit =
      IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData coffee_cup =
      IconData(0xe848, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pound =
      IconData(0xf154, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData instagram =
      IconData(0xf16d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData female =
      IconData(0xf182, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cc_visa =
      IconData(0xf1f0, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData calendar_plus_o =
      IconData(0xf271, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData address_card =
      IconData(0xf2bb, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData coins =
      IconData(0xf51e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData money_bill_wave_alt =
      IconData(0xf53b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData money_check =
      IconData(0xf53c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData file_upload =
      IconData(0xf574, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData fill_drip =
      IconData(0xf576, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData tools =
      IconData(0xf7d9, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
