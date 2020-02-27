import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/bloc/bloc.dart';

List<Widget> footerWidgets({
  BuildContext context,
  Function goToLogin,
  String accessCode,
  String email,
  bool isLoginLoading,
  SignupWithAccessCodeBloc bloc,
  bool isLoading,
  bool isEnabled,
}) =>
    <Widget>[
      Space(vertical: 62),
      BlocBuilder<SignupWithAccessCodeBloc, SignupWithAccessCodeState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is IsButtonEnabledState) {
            email = state.email;
            accessCode = state.code;
            isEnabled = state.status;
          }
          return Button(
            width: 200.0,
            height: 48,
            isLoading: isLoading,
            text: "Next",
            buttonBackgroundColor:
                !isEnabled ? disabledBtnBGColor : normalBtnTextColor,
            onPressed: () {
              if (!isBlank(accessCode) && !isBlank(email)) {
                bloc.dispatch(
                    SignupWithCodeEvent(email: email, code: accessCode));
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
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        isLoading: isLoginLoading,
        onPressed: () {
          if (kIsWeb) {
            Future.delayed(Duration(milliseconds: 100), () {
              Navigator.pushNamed(context, AppRoutePaths.Login);
            });
          } else {
            bloc.dispatch(OAuthLoginEvent());
          }
        },
        buttonBackgroundColor: bgColor,
      ),
    ];
