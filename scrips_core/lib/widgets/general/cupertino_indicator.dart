import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

/*class CupertinoIndicator extends StatelessWidget {
  final String loaderText;

  CupertinoIndicator({this.loaderText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: waitLoaderColor,
      height: 48,
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
              data: ThemeData(
                  cupertinoOverrideTheme:
                      CupertinoThemeData(brightness: Brightness.dark)),
              child: CupertinoActivityIndicator()),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: loaderText != null
                ? Text(
                    loaderText.toUpperCase(),
                    style: boldLabelTextStyle(12, Colors.white),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}*/
Widget cupertinoIndicator(loaderText){
  return Container(
    color: waitLoaderColor,
    height: 48,
    width: double.maxFinite,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: ThemeData(
                cupertinoOverrideTheme:
                CupertinoThemeData(brightness: Brightness.dark)),
            child: CupertinoActivityIndicator()),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: loaderText != null
              ? Text(
            loaderText.toUpperCase(),
            style: boldLabelTextStyle(12, Colors.white),
          )
              : Container(),
        ),
      ],
    ),
  );

}
