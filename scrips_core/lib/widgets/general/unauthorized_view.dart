import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class UnAuthorizedView extends StatelessWidget {
  UnAuthorizedView({Key key, @required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "${message ?? "You are not authorized to access this"}",
          style: normalLabelTextStyle(14, labelTextStyleTextColor),
        ),
      ),
    );
  }
}
