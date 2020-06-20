import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(
        {BuildContext context,
        String email,
        String password,
        LoginBloc bloc}) =>
    [
      Space(
        vertical: 8,
      ),
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
              OnChangedValuesEvent(email: email, password: password),
            );
          } else {
            email = value;
            bloc.add(
              OnChangedValuesEvent(email: email, password: password),
            );
            state.setValidationMessage('');
          }
        },
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldValue: password,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: "Password".toUpperCase(),
        isPassword: true,
        placeholder: "Enter password",
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          password = value;
          bloc.add(
            OnChangedValuesEvent(email: email, password: password),
          );
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      Space(
        vertical: 12,
      ),
    ];
