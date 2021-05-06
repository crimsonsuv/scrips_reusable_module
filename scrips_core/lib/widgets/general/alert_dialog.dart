import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

confirmDialog(
    {BuildContext context,
    String title,
    String message,
    String yesText = "Yes",
    String noText = "No",
    bool isRemove = false,
    bool hideNo = false,
    bool manualPopup = false,
    double width,
    Function onYes,
    Function onNo}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black26, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Container(
                color: Colors.white,
                width: width ?? 364,
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            title,
                            maxLines: 2,
                            style: boldLabelTextStyle(17, defaultFieldTextColor),
                            softWrap: true,
                          ),
                          Space(
                            vertical: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  message,
                                  maxLines: 6,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                  style: normalLabelTextStyle(15, regularTextColor),
                                ),
                              ),
                            ],
                          ),
                          Space(
                            vertical: 24,
                          ),
                          Flexible(
                            child: Row(
                              children: <Widget>[
                                (hideNo)
                                    ? Container()
                                    : Row(
                                        children: <Widget>[
                                          Button(
                                            buttonBackgroundColor: enabledBtnBGColor,
                                            text: noText,
                                            height: 32,
                                            style: semiBoldLabelTextStyle(15, enabledBtnTextColor),
                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                            onPressed: () {
                                              if (onNo != null) onNo();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          Space(
                                            horizontal: 8,
                                          ),
                                        ],
                                      ),
                                Button(
                                  buttonBackgroundColor: bgColor,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  text: yesText,
                                  height: 32,
                                  style: semiBoldLabelTextStyle(15, isRemove ? red : enabledBtnBGColor),
                                  onPressed: () {
                                    if (onYes != null) onYes();
                                    if (!manualPopup) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                )
                              ],
                            ),
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
