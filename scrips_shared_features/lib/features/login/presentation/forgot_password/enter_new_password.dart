import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';

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
      nextBtnTitle: "Send Invite",
      onBack: () {
        // Navigator.pop(context);
      },
      onNext: () {
        Navigator.pushNamed(context, RoutePaths.PmSignUpInvite);
      },
      headerWidgets: [
        Container(
          margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
          child: Text("Enter Your New Password",
              style: boldLabelTextStyle(17.0, textInputColor)),
        ),
      ],
      bodyWidgets: [
        FieldAndLabel(
          labelTextStyle: defaultFieldLabelStyle(null, null),
          fieldType: FieldType.TextField,
          fieldBackgroundColor: textFieldBGcolor,
          labelValue: "New Password".toUpperCase(),
          placeholder: "New Password",
          axis: Axis.vertical,
          enabled: true,
        ),
        FieldAndLabel(
          labelTextStyle: defaultFieldLabelStyle(null, null),
          fieldType: FieldType.TextField,
          fieldBackgroundColor: textFieldBGcolor,
          labelValue: "Confirm Password".toUpperCase(),
          isPassword: true,
          placeholder: "Confirm Password",
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
              child: Text("Set New Password",
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
