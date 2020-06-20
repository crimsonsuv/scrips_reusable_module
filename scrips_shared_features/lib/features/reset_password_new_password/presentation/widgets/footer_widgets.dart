import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/reset_password_new_password/presentation/bloc/bloc.dart';

List<Widget> footerWidgets(
        {BuildContext context,
        String password,
        String confirmPassword,
        bool isLoading,
        bool isLoginLoading,
        bool isEnabled,
        Map<String, String> arguments,
        ResetPasswordNewPasswordBloc bloc}) =>
    <Widget>[
      Space(vertical: 62),
      BlocBuilder<ResetPasswordNewPasswordBloc, ResetPasswordNewPasswordState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is IsButtonEnabledState) {
            password = state.password;
            confirmPassword = state.confirmPassword;
            isEnabled = state.status;
          }
          return Button(
            height: 48,
            width: 194,
            text: "Set New Password",
            isLoading: isLoading,
            style: normalLabelTextStyle(17, enabledBtnTextColor),
            buttonBackgroundColor:
                isEnabled ? enabledBtnBGColor : disabledBtnBGColor,
            onPressed: () {
              if (isEnabled) {
                bloc.add(CreatePassEvent(
                    password: password,
                    confirmPassword: confirmPassword,
                    email: arguments["email"],
                    passwordResetToken: arguments["passwordResetToken"]));
              }
            },
          );
        },
      ),
      Space(
        vertical: 24,
      ),
      Button(
        width: 222.0,
        height: 48,
        text: "Log In",
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: () {
          if (kIsWeb) {
            Future.delayed(Duration(milliseconds: 100), () {
              Navigator.pushNamed(context, AppRoutePaths.Login);
            });
          } else {
            bloc.add(OAuthLoginEvent());
          }
        },
        buttonBackgroundColor: bgColor,
      ),
    ];
