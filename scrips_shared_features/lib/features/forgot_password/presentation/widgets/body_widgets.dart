import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/bloc.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(
        {BuildContext context, String email, ForgotPasswordBloc bloc}) =>
    [
      FieldAndLabel(
        isMandatory: false,
        fieldBackgroundColor: textFieldBGcolor,
        fieldType: FieldType.TextField,
        labelTextStyle: defaultFieldLabelStyle(null, null),
        labelValue: 'Email Address'.toUpperCase(),
        fieldValue: email,
        placeholder: 'Enter email address',
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          if (!isEmail(value) && !isBlank(value.toString())) {
            email = "";
            state.setValidationMessage("Email is not valid");
            bloc.add(
              EnabledButtonEvent(email: email),
            );
          } else {
            email = value;
            bloc.add(
              EnabledButtonEvent(email: email),
            );
            state.setValidationMessage('');
          }
        },
      ),
      Space(
        vertical: 10,
      )
    ];
