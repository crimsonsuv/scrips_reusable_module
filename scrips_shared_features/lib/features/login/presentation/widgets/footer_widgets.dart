import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
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
                ? () {
                    if ((editedUser.email == "user@scrips.com" ||
                            editedUser.email == "admin@scrips.com") &&
                        editedUser.password == "123456") {
                      bloc.dispatch(
                        DoLoginEvent(context, editedUser),
                      );
                    } else {
                      showToastWidget(
                        Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "Email or Password is not correct",
                                style: normalLabelTextStyle(
                                    16, enabledBtnTextColor),
                              ),
                            ),
                          ),
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
          Navigator.pushNamed(context, RoutePaths.PmForgotPassword);
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
                Navigator.pushNamed(
                    context, RoutePaths.PmSignUpStepWithAccessCode);
              },
              buttonBackgroundColor: bgColor,
            )
          : Container(),
    ];
