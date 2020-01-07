import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:validators/validators.dart';

List<Widget> bodyWidgets(User loginUser, BuildContext context) => [
      Space(
        vertical: 8,
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldProperty: loginUser?.email,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: 'Email Address'.toUpperCase(),
        placeholder: 'Email Address',
        axis: Axis.vertical,
        enabled: true,
        onEditingComplete: (value, FieldAndLabelState state) {
          loginUser.email.value = value;
          if (!isEmail(value)) {
            state.setValidationMessage("Not a valid Email");
          } else {
            state.setValidationMessage("Not a valid Email");
          }
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldProperty: loginUser?.password,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: "Password".toUpperCase(),
        isPassword: true,
        placeholder: "Password",
        axis: Axis.vertical,
        enabled: true,
        onEditingComplete: (value, FieldAndLabelState state) {
          loginUser.password.value = value;
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      Space(
        vertical: 12,
      ),
    ];
