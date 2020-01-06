import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';
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
        labelValue: S.of(context).email_address.toUpperCase(),
        placeholder: S.of(context).email_address,
        axis: Axis.vertical,
        enabled: true,
        onEditingComplete: (value, FieldAndLabelState state) {
          loginUser.email.value = value;
          if (!isEmail(value)) {
            state.setValidationMessage(S.of(context).not_a_valid_email);
          } else {
            state.setValidationMessage(S.of(context).not_a_valid_email);
          }
        },
//                validationMessage: globalModel.data.loginError.value,
      ),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldProperty: loginUser?.password,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: S.of(context).password.toUpperCase(),
        isPassword: true,
        placeholder: S.of(context).password,
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
