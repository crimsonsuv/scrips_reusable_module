import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';

List<Widget> footerWidgets(
        {String email,
        String password,
        BuildContext context,
        bool isLoading,
        LoginBloc bloc,
        bool isEnabled,
        bool shouldShowSignUpWithAccessCode}) =>
    <Widget>[
      Space(vertical: 62),
      BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is EnableLoginButtonState) {
            email = state.email;
            password = state.password;
            isEnabled = state.status;
          }
          return Button(
            width: 200.0,
            height: 48,
            text: "Log In",
            buttonBackgroundColor:
                (isEnabled) ? normalBtnTextColor : disabledBtnBGColor,
            onPressed: (isEnabled)
                ? () {
                    bloc.add(DoLoginEvent(email: email, password: password));
                  }
                : null,
            isLoading: isLoading,
            style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor),
          );
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
        onPressed: () {
          Future.delayed(Duration(milliseconds: 100), () {
            Navigator.pushNamed(context, AppRoutePaths.ForgotPassword);
          });
        },
        buttonBackgroundColor: bgColor,
      ),
      shouldShowSignUpWithAccessCode != null && shouldShowSignUpWithAccessCode
          ? Button(
              width: 222.0,
              height: 48,
              text: "Sign Up with access Code",
              style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutePaths.SignUp);
              },
              buttonBackgroundColor: bgColor,
            )
          : Container(),
    ];
