import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/forgot_password_state.dart';

List<Widget> footerWidgets({
  BuildContext context,
  String email,
  ForgotPasswordBloc bloc,
  bool isLoading,
  bool isLoginLoading,
  bool isEnabled,
}) =>
    <Widget>[
      Space(vertical: 62),
      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is IsButtonEnabledState) {
            email = state.email;
            isEnabled = state.status;
          }
          return Button(
            width: 200.0,
            height: 48,
            isLoading: isLoading,
            text: "Reset Your Password",
            buttonBackgroundColor:
                !isEnabled ? disabledBtnBGColor : normalBtnTextColor,
            onPressed: () {
              if (!isBlank(email)) {
                bloc.add(ForgotPasswordCallEvent(email: email));
              }
            },
            style: semiBoldLabelTextStyle(
                17.0, !isEnabled ? disabledBtnTextColor : enabledBtnTextColor),
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
        isLoading: isLoginLoading,
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: () {
          if (kIsWeb || Platform.isMacOS) {
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
