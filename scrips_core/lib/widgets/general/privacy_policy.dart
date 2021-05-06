import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: enabledBtnTextColor,
        elevation: 0.5,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Images.instance.appName(color: enabledBtnBGColor),
            ),
          ],
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Images.instance.asset(name: "ic_back")),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                  child: Text(
                "Done",
                style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
              )),
            )),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Scrips' Privacy Policy",
            style: boldLabelTextStyle(22, textInputColor),
          ),
        ),
      ),
    );
  }
}
