import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

confirmDialog({
  BuildContext context,
  String title,
  String message,
  String yesText = "Yes",
  String noText = "No",
  bool isRemove = false,
  Function onYes,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Container(
                color: Colors.white,
                width: 364,
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            title,
                            maxLines: 2,
                            style:
                                boldLabelTextStyle(17, defaultFieldTextColor),
                            softWrap: true,
                          ),
                          Space(
                            vertical: 16,
                          ),
                          Text(
                            message,
                            maxLines: 4,
                            style: normalLabelTextStyle(15, regularTextColor),
                            softWrap: true,
                          ),
                          Space(
                            vertical: 24,
                          ),
                          Row(
                            children: <Widget>[
                              Button(
                                buttonBackgroundColor: enabledBtnBGColor,
                                text: noText,
                                height: 32,
                                width: 80,
                                style: semiBoldLabelTextStyle(
                                    15, enabledBtnTextColor),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Space(
                                horizontal: 8,
                              ),
                              Button(
                                buttonBackgroundColor: bgColor,
                                text: yesText,
                                height: 32,
                                width: 80,
                                style: semiBoldLabelTextStyle(
                                    15, isRemove ? red : enabledBtnBGColor),
                                onPressed: () {
                                  onYes();
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      );
    },
  );
}
