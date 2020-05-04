import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class IndicatorTagWidget extends StatelessWidget {
  final String indicatorText;
  //
  IndicatorTagWidget({
    Key key,
    this.indicatorText,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: successTabColor,
        borderRadius: BorderRadius.circular(2),
      ),
      height: 16,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Center(
          child: Text(
            "$indicatorText",
            style: semiBoldLabelTextStyle(13, enabledBtnTextColor),
          ),
        ),
      ),
    );
  }
}
