import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';

List<Widget> footerWidgets(User editedUser, BuildContext context,
        bool isLoading, LoginBloc bloc, bool isEnabled,
        [bool shouldShowSignUpWithAccessCode]) =>
    <Widget>[
      Space(vertical: 62),
      BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is EnableLoginButtonState) {
            isEnabled = state.status;
          }
          return Button(
            width: 200.0,
            height: 48,
            text: "Login",
            buttonBackgroundColor:
                (isEnabled) ? normalBtnTextColor : disabledBtnBGColor,
            onPressed: (isEnabled)
                ? () async {
                    if ((editedUser.email == "user@scrips.com" ||
                            editedUser.email == "admin@scrips.com") &&
                        editedUser.password == "123456") {
                      bloc.dispatch(
                        DoLoginEvent(context, editedUser),
                      );
                    } else {
                      showToastWidget(
                        ToastWidget(
                          message: "Email or Password is not correct",
                          backgroundColor: red,
                        ),
                        position: ToastPosition.top,
                        context: context,
                        duration: Duration(seconds: 2),
                      );
                    }
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
