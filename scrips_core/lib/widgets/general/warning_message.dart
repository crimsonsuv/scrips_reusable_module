import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

class WarningMessage extends StatelessWidget {
  WarningMessage({Key key, @required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: enabledBtnTextColor,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: red, width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  color: red, borderRadius: BorderRadius.circular(6)),
              child: ScripsIcons.instance.icon(ScripsIcons.alert,
                  size: 18, color: enabledBtnTextColor),
            ),
            Space(
              horizontal: 16,
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "$message",
                        style: normalLabelTextStyle(15, regularTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
