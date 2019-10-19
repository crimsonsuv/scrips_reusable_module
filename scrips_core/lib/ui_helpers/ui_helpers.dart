import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 20.0;
  static const double _VerticalSpaceLarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall = SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium = SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceLarge = SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall = SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium = SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge = SizedBox(width: _HorizontalSpaceLarge);

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  /// Provides an input field with a title that stretches the full width of the screen
  static Widget inputField(
      {String title,
      String placeholder,
      @required TextEditingController controller,
      String validationMessage,
      bool isPassword = false,
      double spaceBetweenTitle = 15.0,
      double padding = 10.0}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      PlatformText(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0)),
      validationMessage != null
          ? PlatformText(validationMessage,
              style: TextStyle(color: Colors.red[400], fontSize: 12.0))
          : Container(),
      Container(
        alignment: Alignment(0.0, 0.0),
        padding: EdgeInsets.only(left: padding),
        margin: EdgeInsets.only(top: spaceBetweenTitle),
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: lightGrey),
        child: TextField(
          controller: controller,
          obscureText: isPassword != null ? true : false,
          style: TextStyle(fontSize: 12.0),
          decoration: InputDecoration.collapsed(
              hintText: placeholder, hintStyle: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
        ),
      )
    ]);
  }

  static Widget fullScreenButton({String title, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Color.fromARGB(255, 9, 202, 172)),
        child: Center(child: PlatformText(title, style: TextStyle(fontWeight: FontWeight.w800))),
      ),
    );
  }
}
