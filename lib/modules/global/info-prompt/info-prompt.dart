import 'package:flutter/material.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class InfoPrompt extends StatelessWidget {
  final String message;

  const InfoPrompt(this.message) : super();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeColors.darkGrey,
      title: Row(children: [
        Icon(Icons.info_outline, color: ThemeColors.light, size: 22),
        SizedBox(width: 6),
        Text("Info",
            style: TextStyle(
                color: ThemeColors.lightPink,
                fontSize: 18,
                fontWeight: FontWeight.w500))
      ]),
      content: Text(
        message,
        style: TextStyle(
            fontFamily: KtsAppWidgetStyles.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ThemeColors.light),
      ),
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Done',
            style: TextStyle(color: ThemeColors.darkPink),
          ),
        ),
      ],
    );
  }
}
