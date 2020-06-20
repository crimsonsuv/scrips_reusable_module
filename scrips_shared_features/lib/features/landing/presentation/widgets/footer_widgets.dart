import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/landing/presentation/bloc/landing/landing_bloc.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

List<Widget> footerWidgets(
        {BuildContext context,
        Function goToSignup,
        Function goToForgotPassword,
        LandingBloc bloc,
        bool isLoading}) =>
    <Widget>[
      Space(
        vertical: 97,
      ),
      Button(
        height: 48,
        width: 176,
        text: "Log In",
        isLoading: isLoading,
        style: normalLabelTextStyle(17, enabledBtnTextColor),
        buttonBackgroundColor: enabledBtnBGColor,
        onPressed: () {
          if (kIsWeb || Platform.isMacOS) {
            Future.delayed(Duration(milliseconds: 100), () {
              Navigator.pushNamed(context, AppRoutePaths.Login);
            });
          } else {
            bloc.add(OAuthLoginEvent());
          }
        },
      ),
      Space(
        vertical: 32,
      ),
      Button(
        width: 222.0,
        height: 48,
        text: S.of(context).forgotPassword,
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: goToForgotPassword,
        buttonBackgroundColor: bgColor,
      ),
      Space(
        vertical: 10,
      ),
      (currentAppType == AppType.UK)
          ? Container()
          : Button(
              height: 48,
              width: 222,
              text: S.of(context).signUpWithAccessCode,
              style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
              buttonBackgroundColor: textFieldBGcolor,
              onPressed: goToSignup,
            ),
    ];
