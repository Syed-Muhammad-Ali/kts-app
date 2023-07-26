import 'package:flutter/material.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';

class ValidationErrorPrompt extends StatelessWidget {
  final List<dynamic> messages;
  final String title;

  const ValidationErrorPrompt(this.title, this.messages) : super();

  String getUserFriendlyMessage(String msg) {
    if (msg.contains("CustomerNameExisits")) {
      return "A customer with the name provided already exists, please ensure customer names are unique.";
    } else if (msg.contains("ServiceNameExisits")) {
      return "A service with the name provided already exists, please ensure service names are unique.";
    } else if (msg.contains("CustomerInUse")) {
      return "The customer has one or more appointments and cannot be deleted.";
    } else if (msg.contains("ServiceInUse")) {
      return "The service has one or more appointments and cannot be deleted.";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeColors.darkGrey,
      title: Row(children: [
        Icon(Icons.error_outline_outlined,
            color: ThemeColors.darkPink, size: 22),
        SizedBox(width: 6),
        Text(this.title,
            style: TextStyle(
                color: ThemeColors.darkPink,
                fontSize: 18,
                fontWeight: FontWeight.w500))
      ]),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: messages.map((e) {
            return Text(
              getUserFriendlyMessage(e.toString()),
              style: TextStyle(
                  fontFamily: KtsAppWidgetStyles.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.light),
            );
          }).toList()),
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Ok',
            style: TextStyle(color: ThemeColors.darkPink),
          ),
        ),
      ],
    );
  }
}
