import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(BuildContext context, User initialUser,
        User editedUser, LoginBloc bloc) =>
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
        fieldValue: initialUser?.email,
        placeholder: 'Email Address',
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          if (!isEmail(value)) {
            editedUser.email = "";
            state.setValidationMessage("Not a valid Email");
            bloc.dispatch(
              OnChangedValuesEvent(editedUser),
            );
          } else {
            editedUser.email = value;
            bloc.dispatch(
              OnChangedValuesEvent(editedUser),
            );
            state.setValidationMessage('');
          }
        },
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldValue: initialUser?.password,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: "Password".toUpperCase(),
        isPassword: true,
        placeholder: "Password",
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          editedUser.password = value;
          bloc.dispatch(
            OnChangedValuesEvent(editedUser),
          );
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      Space(
        vertical: 12,
      ),
    ];
