import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';

class PasswordSent extends StatefulWidget {
  @override
  _PasswordSent createState() => _PasswordSent();
}

class _PasswordSent extends State<PasswordSent> {
  Widget next;
  bool switchValue = false;

  //  _SignUpStep2({Key key,
  //                this.next,
  //                this.switchValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              color: textFieldBGcolor,
            ),
            child: Center(),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 0.0, top: 20.0, bottom: 8.0, right: 12.0),
            child: FlatButton(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Images.instance.back(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      S.of(context).back,
                      style: boldLabelTextStyle(14.0, normalBtnTextColor),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      left: 8.0, top: 8.0, bottom: 40.0, right: 8.0),
                  child: Images.instance.success()),
              Container(
                  margin: EdgeInsets.only(
                      left: 8.0, top: 8.0, bottom: 16.0, right: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(S.of(context).check_your_email,
                        style: boldLabelTextStyle(17.0, textInputColor)),
                  )),
              Container(
                child: Text(
                    S.of(context).we_sent_you_a_link_to_set_a_new_password,
                    style: normalLabelTextStyle(15.0, textInputColor)),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
