import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class ToastWidget extends StatelessWidget {
  ToastWidget({Key key, @required this.message, @required this.backgroundColor, this.textColor ,this.width = 400})
      : super(key: key);
  final String message;
  final Color backgroundColor;
  final double width;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      elevation: 2,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "$message",
                style: normalLabelTextStyle(16, textColor ?? enabledBtnTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
