import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';

class EnterNewPassword extends StatefulWidget {
  @override
  _EnterNewPassword createState() => _EnterNewPassword();
}

class _EnterNewPassword extends State<EnterNewPassword> {
  Widget next;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleView(
      showBackButton: true,
      showAppIcon: true,
      showNext: false,
      iconImage: Images.instance.pmAppIcon(),
      nextBtnTitle: S.of(context).send_invite,
      onBack: () {
        // Navigator.pop(context);
      },
      onNext: () {
        Navigator.pushNamed(context, RoutePaths.PmSignUpInvite);
      },
      headerWidgets: [
        Container(
          margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
          child: Text(S.of(context).enter_your_new_password,
              style: boldLabelTextStyle(17.0, textInputColor)),
        ),
      ],
      bodyWidgets: [
        FieldAndLabel(
          labelTextStyle: defaultFieldLabelStyle(null, null),
          fieldType: FieldType.TextField,
          fieldBackgroundColor: textFieldBGcolor,
          labelValue: S.of(context).new_password.toUpperCase(),
          placeholder: S.of(context).new_password,
          axis: Axis.vertical,
          enabled: true,
        ),
        FieldAndLabel(
          labelTextStyle: defaultFieldLabelStyle(null, null),
          fieldType: FieldType.TextField,
          fieldBackgroundColor: textFieldBGcolor,
          labelValue: S.of(context).confirm_password.toUpperCase(),
          isPassword: true,
          placeholder: S.of(context).confirm_password,
          axis: Axis.vertical,
          enabled: true,
        ),
      ],
      footerWidgets: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 48),
          child: SizedBox(
            width: 200.0,
            height: 48,
            child: FlatButton(
              color: disabledBtnBGColor,
              textTheme: ButtonTextTheme.normal,
              onPressed: () {
                /*...*/
                Navigator.pushNamed(context, RoutePaths.PmPasswordSent);
              },
              child: Text(S.of(context).set_new_password,
                  style: boldLabelTextStyle(14.0, disabledBtnTextColor)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0)),
            ),
          ),
        ),
      ],
    );
  }
}
