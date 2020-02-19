import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> footerWidgets(BuildContext context, Function goToHome) => <Widget>[
      Button(
        height: 48,
        width: 194,
        text: "Complete Sign Up",
        style: normalLabelTextStyle(17, enabledBtnTextColor),
        buttonBackgroundColor: enabledBtnBGColor,
        onPressed: goToHome,
      ),
      Space(
        vertical: 24,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: normalLabelTextStyle(15, regularTextColor),
          text: "By completing Signing Up you accept the ",
          children: <TextSpan>[
            TextSpan(
                text: 'Terms and\n Conditions',
                style: boldLabelTextStyle(15, enabledBtnBGColor)),
            TextSpan(
                text: ' and ',
                style: normalLabelTextStyle(15, regularTextColor)),
            TextSpan(
              text: 'Privacy Policy',
              style: boldLabelTextStyle(15, enabledBtnBGColor),
            )
          ],
        ),
      ),
    ];
