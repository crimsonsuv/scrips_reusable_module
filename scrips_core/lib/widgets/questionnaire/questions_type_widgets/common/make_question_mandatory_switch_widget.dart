import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/resizable_cupertino_switch_widget.dart';

class MakeQuestionMandatorySwitchWidget extends StatelessWidget {
  final String text;
  MakeQuestionMandatorySwitchWidget(
      {Key key, this.text, this.status, this.onChange})
      : super(key: key);
  final bool status;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Make this question mandatory",
          style: normalLabelTextStyle(17, regularTextColor),
        ),
        SizedCupertinoSwitch(
          width: 51,
          height: 31,
          value: status,
          onChanged: onChange,
        ),
      ],
    );
  }
}
