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

  static EdgeInsets defaultPadding = EdgeInsets.all(4.0);
  static EdgeInsets defaultPaddingLarge = EdgeInsets.all(8.0);
  static EdgeInsets defaultPaddingVeryLarge = EdgeInsets.all(16.0);
  static EdgeInsets defaultMargin = EdgeInsets.all(4.0);
  static EdgeInsets defaultButtonPadding = EdgeInsets.all(16.0);

  static BoxDecoration defaultButtonBorder = BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: lightGrey);

  static BoxDecoration defaultLabelBoxDecoration(color) => BoxDecoration(
      border: Border.all(color: color ?? defaultLabelBackgroundColor), color: color ?? defaultLabelBackgroundColor);

  static BoxDecoration defaultFieldBoxDecoration(color) => BoxDecoration(
      border: Border.all(color: color ?? defaultFieldBackgroundColor), color: color ?? defaultFieldBackgroundColor);

  static EdgeInsets defaultPanelPadding = EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0, left: 8.0);
  static BoxDecoration defaultPanelBorder =
      BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5.0));
  static EdgeInsets defaultPanelMargin = EdgeInsets.only(top: 0.0, right: 0.0, bottom: 8.0, left: 0.0);

  static Widget fullScreenButton({String title, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Color.fromARGB(255, 9, 202, 172)),
        child: Center(child: PlatformText(title, style: TextStyle(fontWeight: FontWeight.w800))),
      ),
    );
  }
}
