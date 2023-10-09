import 'package:flutter/services.dart';

// class DecimalTextInputFormatter extends TextInputFormatter {
//   DecimalTextInputFormatter(this.decimalRange) : assert(decimalRange > 0);

//   final int decimalRange;

//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue, // unused.
//     TextEditingValue newValue,
//   ) {
//     TextSelection newSelection = newValue.selection;
//     String truncated = newValue.text;
//     String value = newValue.text;

//     if (value.contains(".") &&
//         value.substring(value.indexOf(".") + 1).length > decimalRange) {
//       truncated = oldValue.text;
//       newSelection = oldValue.selection;
//     } else if (value == ".") {
//       truncated = "0.";

//       newSelection = newValue.selection.copyWith(
//         baseOffset: min(truncated.length, truncated.length + 1),
//         extentOffset: min(truncated.length, truncated.length + 1),
//       );

//       return TextEditingValue(
//         text: truncated,
//         selection: newSelection,
//         composing: TextRange.empty,
//       );
//     }
//     return newValue;
//   }
// }

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter(this.decimalRange) : assert(decimalRange > 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String formattedValue = newValue.text;

    if (newValue.text.contains('.')) {
      List<String> parts = newValue.text.split('.');
      if (parts.length > 2 || parts[1].length > decimalRange) {
        formattedValue = '${parts[0]}.${parts[1].substring(0, decimalRange)}';
      }
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formattedValue.length),
      ),
    );
  }
}
