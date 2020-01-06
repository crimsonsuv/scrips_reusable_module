import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordView createState() => _ForgotPasswordView();
}

class _ForgotPasswordView extends State<ForgotPasswordView> {
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
          margin:
              EdgeInsets.only(left: 8.0, top: 20.0, bottom: 14.0, right: 8.0),
          child: Text(S.of(context).reset_your_password,
              style: boldLabelTextStyle(17.0, textInputColor)),
        ),
        Container(
          child: Text(
              S
                  .of(context)
                  .enter_your_registration_email_to_receive_a_reset_link,
              textAlign: TextAlign.center,
              style: normalLabelTextStyle(15.0, regularTextColor)),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 24),
        ),
      ],
      bodyWidgets: [
        Column(
          children: <Widget>[
            FieldAndLabel(
              labelTextStyle: defaultFieldLabelStyle(null, null),
              fieldType: FieldType.TextField,
              fieldBackgroundColor: textFieldBGcolor,
              labelValue: S.of(context).email_address.toUpperCase(),
              placeholder: S.of(context).email_address,
              axis: Axis.vertical,
              enabled: true,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          ],
        ),
      ],
      footerWidgets: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 52),
          child: SizedBox(
            width: 260.0,
            height: 48,
            child: FlatButton(
              color: disabledBtnBGColor,
              textTheme: ButtonTextTheme.normal,
              onPressed: () {
                /*...*/
                Navigator.pushNamed(context, RoutePaths.PmEnterNewPassword);
              },
              child: Text(S.of(context).reset_your_password,
                  style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 200.0,
            height: 48,
            child: FlatButton(
              textTheme: ButtonTextTheme.normal,
              onPressed: () {
                /*...*/
                Navigator.pop(this.context);
              },
              child: Text(S.of(context).login,
                  style: semiBoldLabelTextStyle(17.0, normalBtnTextColor)),
            ),
          ),
        ),
      ],
    );
  }
}
