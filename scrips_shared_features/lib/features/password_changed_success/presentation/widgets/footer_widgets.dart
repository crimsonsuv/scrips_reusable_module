import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> footerWidgets(
        {BuildContext context,
        Function goToHome,
        String email = "",
        Function goNext}) =>
    <Widget>[
      Space(vertical: 30),
      Button(
        width: 176.0,
        height: 48,
        text: "Login",
        buttonBackgroundColor:
            (!isBlank(email)) ? normalBtnTextColor : disabledBtnBGColor,
        onPressed: goNext,
        style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor),
      ),
    ];
