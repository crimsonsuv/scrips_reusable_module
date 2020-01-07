import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> footerWidgets(
        BuildContext context, Function goToLogin, Function goToSignup) =>
    <Widget>[
      Button(
        height: 48,
        width: 176,
        text: "Login",
        style: normalLabelTextStyle(17, enabledBtnTextColor),
        buttonBackgroundColor: enabledBtnBGColor,
        onPressed: goToLogin,
      ),
      Space(
        vertical: 24,
      ),
      Button(
        height: 48,
        width: 222,
        text: "Sign Up with access Code",
        style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
        buttonBackgroundColor: textFieldBGcolor,
        onPressed: goToSignup,
      ),
    ];
