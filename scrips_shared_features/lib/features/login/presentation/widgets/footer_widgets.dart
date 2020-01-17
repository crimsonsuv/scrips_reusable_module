import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';

List<Widget> footerWidgets(User editedUser, BuildContext context,
        bool isLoading, LoginBloc bloc, bool isEnabled) =>
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
                    bloc.dispatch(
                      DoLoginEvent(context, editedUser),
                    );
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
    ];
