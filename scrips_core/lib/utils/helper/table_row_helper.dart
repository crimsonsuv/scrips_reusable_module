import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class TableRowHelper {
  static TableRow defaultKeyValueTableRow(String key, String value,
          {TextSpan textSpan}) =>
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            key,
            style: boldLabelTextStyle(13, labelTextStyleTextColor,
                lineHeight: 1.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: textSpan == null
              ? Text(
                  value,
                  style:
                      normalLabelTextStyle(13, regularTextColor, height: 1.2),
                )
              : RichText(
                  text: textSpan,
                ),
        )
      ]);

  static TableRow defaultKeyTableRow(String key, Widget value) =>
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            key,
            style: boldLabelTextStyle(13, labelTextStyleTextColor,
                lineHeight: 1.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: value,
        )
      ]);
}
