import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> bodyWidgets(BuildContext context) => [
      FieldAndLabel(
        isMandatory: false,
        fieldBackgroundColor: textFieldBGcolor,
        fieldType: FieldType.TextField,
        labelTextStyle: defaultFieldLabelStyle(null, null),
        labelValue: 'Email Address'.toUpperCase(),
        fieldValue: "suv.das19@gmail.com",
        placeholder: 'Email Address',
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
//      if (!isEmail(value)) {
//        editedUser.email = "";
//        state.setValidationMessage("Not a valid Email");
//        bloc.dispatch(
//          OnChangedValuesEvent(editedUser),
//        );
//      } else {
//        editedUser.email = value;
//        bloc.dispatch(
//          OnChangedValuesEvent(editedUser),
//        );
//        state.setValidationMessage('');
//      }
        },
      ),
      Space(
        vertical: 10,
      )
    ];
