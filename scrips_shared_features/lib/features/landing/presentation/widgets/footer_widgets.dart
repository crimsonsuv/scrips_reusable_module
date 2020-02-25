import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/landing/presentation/bloc/landing/landing_bloc.dart';

List<Widget> footerWidgets(
        {BuildContext context,
        Function goToSignup,
        Function goToForgotPassword,
        LandingBloc bloc,
        bool isLoading}) =>
    <Widget>[
      Button(
        height: 48,
        width: 176,
        text: "Login",
        isLoading: isLoading,
        style: normalLabelTextStyle(17, enabledBtnTextColor),
        buttonBackgroundColor: enabledBtnBGColor,
        onPressed: () {
          if (kIsWeb) {
            Future.delayed(Duration(milliseconds: 100), () {
              Navigator.pushNamed(context, AppRoutePaths.Login);
            });
          } else {
            bloc.dispatch(OAuthLoginEvent());
          }
        },
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
