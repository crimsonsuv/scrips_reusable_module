import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/create_password/presentation/bloc/create_password/bloc.dart';
import 'package:scrips_shared_features/generated/l10n.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(
        {BuildContext context,
        String password,
        String confirmPassword,
        bool isValid,
        CreatePasswordBloc bloc}) =>
    [
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: 'Create password'.toUpperCase(),
        placeholder: 'Create password',
        fieldValue: password,
        axis: Axis.vertical,
        enabled: true,
        isPassword: true,
        onChanged: (value, FieldAndLabelState state) {
          password = value;
          bloc.add(EnabledButtonEvent(
              password: password, confirmPassword: confirmPassword));
        },
      ),
      BlocBuilder<CreatePasswordBloc, CreatePasswordState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is IsButtonEnabledState) {
            password = state.password;
            confirmPassword = state.confirmPassword;
            isValid = state.valid;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: (isValid)
                ? Row(
                    children: <Widget>[
                      Images.instance.smallSuccess(),
                      Space(
                        horizontal: 4,
                      ),
                      Text(
                        "Your password is secure",
                        style: semiBoldLabelTextStyle(13, successTabColor),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "• At least 8 characters",
                              style: semiBoldLabelTextStyle(
                                  13,
                                  (password.length >= 8)
                                      ? successTabColor
                                      : labelTextStyleTextColor),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "• 1 number",
                              style: semiBoldLabelTextStyle(
                                  13,
                                  matches(password, '[0-9]')
                                      ? successTabColor
                                      : labelTextStyleTextColor),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "• 1 lowercase",
                              style: semiBoldLabelTextStyle(
                                  13,
                                  matches(password, '[a-z]')
                                      ? successTabColor
                                      : labelTextStyleTextColor),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "• 1 special character (@, _, !, \$ or %)",
                              style: semiBoldLabelTextStyle(
                                  13,
                                  matches(password, '[@, _, !, \$, %]')
                                      ? successTabColor
                                      : labelTextStyleTextColor),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "• 1 uppercase character",
                              style: semiBoldLabelTextStyle(
                                  13,
                                  matches(password, '[A-Z]')
                                      ? successTabColor
                                      : labelTextStyleTextColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          );
        },
      ),
      Space(vertical: 10),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: S.of(context).confirmPassword.toUpperCase(),
        isPassword: true,
        fieldValue: confirmPassword,
        placeholder: S.of(context).confirmPassword,
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          if (password == value) {
            confirmPassword = value;
            bloc.add(EnabledButtonEvent(
                password: password, confirmPassword: confirmPassword));
            state.setValidationMessage("");
          } else {
            confirmPassword = "";
            bloc.add(EnabledButtonEvent(
                password: password, confirmPassword: confirmPassword));
            state.setValidationMessage("Password not matching");
          }
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
    ];
