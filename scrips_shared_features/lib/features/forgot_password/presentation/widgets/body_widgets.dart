import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> bodyWidgets(BuildContext context) => [
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: 'Create password'.toUpperCase(),
        placeholder: 'Create password',
        axis: Axis.vertical,
        enabled: true,
        isPassword: true,
        onEditingComplete: (value, FieldAndLabelState state) {},
//                validationMessage: globalModel.data.loginError.value,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "• At least 8 characters",
                    style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    "• 1 number",
                    style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
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
                    style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    "• 1 special character (@, _, !, \$ or %)",
                    style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
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
                    style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Space(vertical: 10),
      FieldAndLabel(
        labelTextStyle: defaultFieldLabelStyle(null, null),
        fieldType: FieldType.TextField,
        fieldBackgroundColor: textFieldBGcolor,
        labelValue: 'Confirm password'.toUpperCase(),
        isPassword: true,
        placeholder: 'Confirm password',
        axis: Axis.vertical,
        enabled: true,
        onEditingComplete: (value, FieldAndLabelState state) {},
//                validationMessage: globalModel.data.loginError.value,
      ),
    ];
