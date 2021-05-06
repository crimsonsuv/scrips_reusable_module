import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class NotificationCountIndicator extends StatelessWidget {
  final String count;
  //
  NotificationCountIndicator({
    Key key,
    this.count,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.5),
          child: Text(
            "$count",
            style: boldLabelTextStyle(11, enabledBtnTextColor),
          ),
        ),
      ),
    );
  }
}
