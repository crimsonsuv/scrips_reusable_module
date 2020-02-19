import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> footerWidgets(BuildContext context, Function goToLogin,
        Function goToSignup, Function goToForgotPassword) =>
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
        width: 222.0,
        height: 48,
        text: "Forgot Password?",
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: goToForgotPassword,
        buttonBackgroundColor: bgColor,
      ),
      Button(
        height: 48,
        width: 222,
        text: "Sign Up With Access Code",
        style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
        buttonBackgroundColor: textFieldBGcolor,
        onPressed: goToSignup,
      ),
    ];
