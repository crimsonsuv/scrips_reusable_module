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
      Space(vertical: 62),
      Button(
        width: 200.0,
        height: 48,
//                  isLoading: globalModel.state == ViewState.Busy,
        text: "Set New Password",
        buttonBackgroundColor:
            (!isBlank(email)) ? normalBtnTextColor : disabledBtnBGColor,
        onPressed: goNext,
        style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor),
      ),
      Space(
        vertical: 24,
      ),
      Button(
        width: 222.0,
        height: 48,
        text: "Log In",
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: () {},
        buttonBackgroundColor: bgColor,
      ),
    ];
