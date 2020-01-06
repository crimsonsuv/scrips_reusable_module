import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';

List<Widget> footerWidgets(User loginUser, BuildContext context,
        Function doNavigation, bool isLoading) =>
    <Widget>[
      Space(vertical: 62),
      Button(
        width: 200.0,
        height: 48,
//                  isLoading: globalModel.state == ViewState.Busy,
        text: S.of(context).login,
        buttonBackgroundColor: (!isBlank(loginUser?.password?.value) &&
                !isBlank(loginUser?.email?.value))
            ? normalBtnTextColor
            : disabledBtnBGColor,
        onPressed: () {
          doNavigation(loginUser);
        },
        isLoading: isLoading,
        style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor),
      ),
      Space(
        vertical: 24,
      ),
      Button(
        width: 222.0,
        height: 48,
        text: S.of(context).forgot_password,
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.PmForgotPassword);
        },
        buttonBackgroundColor: bgColor,
      ),
    ];
