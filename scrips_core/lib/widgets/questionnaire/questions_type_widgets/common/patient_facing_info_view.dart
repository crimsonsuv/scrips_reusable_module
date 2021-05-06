import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class PatientFacingInfoWidget extends StatelessWidget {
  final String text;
  PatientFacingInfoWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(width: 1, color: separatorColor)),
      child: Center(
        child: Text(
          "$text",
          style: normalLabelTextStyle(13, defaultFieldHintColor),
        ),
      ),
    );
  }
}
