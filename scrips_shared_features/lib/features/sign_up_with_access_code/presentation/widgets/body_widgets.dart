import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/bloc/bloc.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(
        {BuildContext context,
        String email,
        String accessCode,
        SignupWithAccessCodeBloc bloc}) =>
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
        placeholder: 'Email Address',
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          if (!isEmail(value)) {
            email = "";
            state.setValidationMessage("Not a valid Email");
            bloc.add(
              EnabledButtonEvent(email: email, code: accessCode),
            );
          } else {
            email = value;
            bloc.add(
              EnabledButtonEvent(email: email, code: accessCode),
            );
            state.setValidationMessage('');
          }
        },
      ),
      FieldAndLabel(
        fieldBackgroundColor: textFieldBGcolor,
        fieldValue: accessCode,
        fieldTextColor: textInputColor,
        fieldType: FieldType.TextField,
        labelTextStyle: defaultFieldLabelStyle(null, null),
        labelValue: "Code".toUpperCase(),
        placeholder: "Enter Code",
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          accessCode = value;
          bloc.add(
            EnabledButtonEvent(email: email, code: accessCode),
          );
        },
      ),
      Space(
        vertical: 12,
      ),
    ];
