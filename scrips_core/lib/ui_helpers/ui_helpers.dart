import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

import 'app_sizes.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {

  static Widget verticalSpaceSmall = SizedBox( height: verticalSpaceSmallSize );
  static Widget verticalSpaceMedium = SizedBox( height: verticalSpaceMediumSize );
  static Widget verticalSpaceLarge = SizedBox( height: verticalSpaceLargeSize );

  static Widget horizontalSpaceSmall = SizedBox( width: horizontalSpaceSmallSize );
  static Widget horizontalSpaceMedium = SizedBox( width: horizontalSpaceMediumSize );
  static Widget horizontalSpaceLarge = SizedBox( width: horizontalSpaceLargeSize );

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace ( double height ) {
    return Container( height: height );
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace ( double width ) {
    return Container( width: width );
  }

  static EdgeInsets defaultPadding = EdgeInsets.all( defaultPaddingSize );
  static EdgeInsets defaultPaddingLarge = EdgeInsets.all( defaultPaddingLargeSize );
  static EdgeInsets defaultPaddingVeryLarge = EdgeInsets.all( defaultPaddingVeryLargeSize );
  static EdgeInsets defaultMargin =
  EdgeInsets.all(
      defaultMarginSize );
  static EdgeInsets defaultButtonPadding = EdgeInsets.all( defaultButtonPaddingSize );

  static BoxDecoration defaultButtonBorder = BoxDecoration(
      borderRadius: BorderRadius.circular( 5.0 ), color: lightGrey );

  static BoxDecoration defaultLabelBoxDecoration ( color ) =>
      BoxDecoration(
          border: Border.all( color: color ?? defaultLabelBackgroundColor ),
          color: color ?? defaultLabelBackgroundColor );

  static BoxDecoration defaultFieldBoxDecoration ( color ) =>
      BoxDecoration(
          border: Border.all( color: color ?? defaultFieldBackgroundColor ),
          color: color ?? defaultFieldBackgroundColor );

  static EdgeInsets defaultPanelPadding = EdgeInsets.all( defaultPaddingSize );
  static BoxDecoration defaultPanelBorder =
  BoxDecoration( color: Colors.transparent,
                   borderRadius: BorderRadius.circular( defaultPaddingBorderRadiusSize ), );

  static EdgeInsets defaultPanelMargin = EdgeInsets.all( defaultPanelMarginSize );


}
