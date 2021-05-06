import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

Future<void> confirmationDialog(BuildContext context,
    {String titleText,
      String yesText = 'Yes',
      String noText = 'No',
      String contentText,
      Function onYesPressed,
      Function onNoPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          titleText,
          style: semiBoldLabelTextStyle(17, Colors.black),
        ),
        content: Text(
          contentText,
          style: normalLabelTextStyle(13, Colors.black),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              yesText,
              style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onYesPressed();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              noText,
              style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
