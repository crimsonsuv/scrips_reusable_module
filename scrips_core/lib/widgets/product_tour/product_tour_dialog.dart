import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

void productTourDialog(context, {Function() onStart}) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: 594,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Images.instance.asset(name: 'ic_product_tour_top', width: 594, height: 131, fit: BoxFit.fill),
                Space(
                  vertical: 44,
                ),
                Text(
                  "Welcome to scrips® product tour",
                  style: boldLabelTextStyle(17, textInputColor, lineHeight: 1),
                ),
                Space(
                  vertical: 16,
                ),
                Text(
                  "In this tour we will explain how the scheduling module is\n structured. Click ‘Start’ to proceed.",
                  style: normalLabelTextStyle(13, textInputColor, letterSpacing: -0.03, height: 1.5),
                  textAlign: TextAlign.center,
                ),
                Space(
                  vertical: 16,
                ),
                Button(
                  width: 113,
                  height: 32,
                  radius: 6.0,
                  buttonBackgroundColor: enabledBtnBGColor,
                  text: "Start",
                  onPressed: () {
                    onStart.call();
                    Navigator.pop(context);
                  },
                  style: boldLabelTextStyle(15, Colors.white),
                ),
                Space(
                  vertical: 16,
                ),
                Button(
                  width: 113,
                  height: 32,
                  buttonBackgroundColor: Colors.transparent,
                  text: "Quit",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: normalLabelTextStyle(15, enabledBtnBGColor),
                )
              ],
            ),
          ),
        );
      }).then((value) {
    return true;
  });
}
