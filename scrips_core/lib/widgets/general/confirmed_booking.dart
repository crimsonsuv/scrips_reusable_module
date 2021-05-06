import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/header_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';

class ConfirmBookingScreen extends StatefulWidget {
  @override
  _ConfirmBookingScreenState createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: headerWidget(context,
          title: Images.instance.appName(color: logoColor),
          isBack: InkWell(
              onTap: () {
                Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutePaths.Home,
                      (Route<dynamic> route) => false);
                });
              },
              child: Images.instance.asset(name: "ic_cross"))),
      body: CupertinoPageScaffold(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ScripsIcons.instance.icon(ScripsIcons.list),
                Space(
                  vertical: 16,
                ),
                Text(
                  "Your Booking Has Been Confirmed",
                  style: boldLabelTextStyle(16, textInputColor),
                ),
                Space(
                  vertical: 10,
                ),
                Text(
                  "we will remind you about your visit so you're on track",
                  textAlign: TextAlign.center,
                  style: normalLabelTextStyle(13, textInputColor),
                ),
                Space(
                  vertical: 16,
                ),
                Button(
                  width: 116,
                  height: 44,
                  buttonBackgroundColor: enabledBtnBGColor,
                  text: "Done",
                  style: boldLabelTextStyle(14, Colors.white),
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 100), () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRoutePaths.Home, (Route<dynamic> route) => true);
                    });
                  },
                ),
                Space(
                  vertical: 16,
                ),
                InkWell(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 100), () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRoutePaths.Home, (Route<dynamic> route) => false);
                    });
                  },
                  child: Text(
                    "View My Appointment",
                    style: boldLabelTextStyle(14, enabledBtnBGColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
