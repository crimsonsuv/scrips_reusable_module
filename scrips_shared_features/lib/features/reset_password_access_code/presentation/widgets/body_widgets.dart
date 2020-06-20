import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/reset_password_access_code/presentation/bloc/bloc.dart';

List<Widget> bodyWidgets(
        {BuildContext context,
        ResetPasswordAccessCodeBloc bloc,
        bool isLoading,
        String email,
        String code}) =>
    [
      FieldAndLabel(
        isMandatory: false,
        fieldBackgroundColor: textFieldBGcolor,
        fieldType: FieldType.TextField,
        labelTextStyle: defaultFieldLabelStyle(null, null),
        labelValue: 'RESET CODE'.toUpperCase(),
        fieldValue: code,
        placeholder: 'Enter reset code',
        axis: Axis.vertical,
        enabled: true,
        onChanged: (value, FieldAndLabelState state) {
          code = value;
          bloc.add(
            EnabledButtonEvent(email: email, code: code),
          );
          state.setValidationMessage('');
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            (isLoading)
                ? Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Center(
                          child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    enabledBtnBGColor),
                              ))),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      bloc.add(ResendCodeCallEvent(email: email));
                    },
                    child: Text(
                      "Resend Code",
                      style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
                    ),
                  ),
          ],
        ),
      ),
      Space(
        vertical: 16,
      )
    ];
