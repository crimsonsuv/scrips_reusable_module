import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/create_password/presentation/bloc/create_password/bloc.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

List<Widget> footerWidgets(
        {BuildContext context,
        String password,
        String confirmPassword,
        bool isLoading,
        bool isEnabled,
        Map<String, String> arguments,
        CreatePasswordBloc bloc}) =>
    <Widget>[
      BlocBuilder<CreatePasswordBloc, CreatePasswordState>(
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
            text: S.of(context).completeSignUp,
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
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: normalLabelTextStyle(15, regularTextColor),
          text: S.of(context).byCompletingSigningUpYouAcceptThe,
          children: <TextSpan>[
            TextSpan(
                text: ' Terms and\n Conditions',
                style: boldLabelTextStyle(15, enabledBtnBGColor)),
            TextSpan(
                text: ' and ',
                style: normalLabelTextStyle(15, regularTextColor)),
            TextSpan(
              text: 'Privacy Policy',
              style: boldLabelTextStyle(15, enabledBtnBGColor),
            )
          ],
        ),
      ),
    ];
