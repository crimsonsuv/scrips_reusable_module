import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

class QuestionCommonButtonsWidget extends StatelessWidget {
  final String text;
  QuestionCommonButtonsWidget(
      {Key key,
      this.text,
      this.onSave,
      this.onRemove,
      this.onCancel,
      this.isSaveEnabled = true})
      : super(key: key);
  final bool isSaveEnabled;
  final Function onCancel;
  final Function onRemove;
  final Function onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Button(
                height: 32,
                width: 72,
                buttonBackgroundColor:
                    isSaveEnabled ? enabledBtnBGColor : disabledBtnBGColor,
                style: semiBoldLabelTextStyle(15,
                    isSaveEnabled ? enabledBtnTextColor : disabledBtnTextColor),
                text: "Save",
                onPressed: isSaveEnabled ? onSave : null),
            Space(
              horizontal: 10,
            ),
            Button(
              height: 32,
              width: 72,
              buttonBackgroundColor: bgColor,
              style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
              text: "Cancel",
              onPressed: onCancel,
            ),
            Expanded(
              child: Container(),
            ),
            Button(
              height: 32,
              width: 178,
              buttonBackgroundColor: bgColor,
              style: semiBoldLabelTextStyle(15, red),
              text: "Remove This Question",
              onPressed: onRemove,
            ),
          ],
        ),
      ],
    );
  }
}
