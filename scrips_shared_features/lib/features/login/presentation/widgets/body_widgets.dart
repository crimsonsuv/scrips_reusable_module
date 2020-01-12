import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(BuildContext context, LoginBloc bloc) => [
      Space(
        vertical: 8,
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldValue: bloc?.user?.email,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: 'Email Address'.toUpperCase(),
        placeholder: 'Email Address',
        axis: Axis.vertical,
        enabled: true,
        validationMessage:
            (!isEmail(bloc?.user?.email ?? "")) ? "Not a valid Email" : "",
        onChanged: (value, FieldAndLabelState state) {
          bloc.dispatch(
            OnChangedValues(value, bloc?.user?.password),
          );
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldValue: bloc?.user?.password,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: "Password".toUpperCase(),
        isPassword: true,
        placeholder: "Password",
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          bloc.dispatch(
            OnChangedValues(bloc?.user?.email, value),
          );
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      Space(
        vertical: 12,
      ),
    ];
