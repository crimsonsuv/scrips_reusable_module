import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_sizes.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
import 'package:scrips_core/widgets/general/space.dart';

class SpaceHelper {
  static Widget spacer({double width = 1, double height = 1}) => Space(
        horizontal: width,
        vertical: height,
      );

  static Widget horizontalSpaceDefault = spacer(width: defaultPaddingSize);
  static Widget horizontalSpace6 = spacer(width: 6);
  static Widget horizontalSpace8 = spacer(width: defaultPaddingLargeSize);
  static Widget horizontalSpace12 = spacer(width: 12);

  static Widget horizontalSpace10 = UIHelper.horizontalSpaceSmall;

  static Widget horizontalSpace16 = spacer(width: defaultPaddingVeryLargeSize);
  static Widget horizontalSpace18 = spacer(width: 18);
  static Widget horizontalSpace20 = spacer(width: 20);
  static Widget horizontalSpace24 = spacer(width: 24);
  static Widget horizontalSpace32 = spacer(width: 32);
  static Widget horizontalSpace42 = spacer(width: 42);

  static Widget verticalSpace2 = spacer(height: 2);
  static Widget verticalSpaceDefault = spacer(height: defaultPaddingSize);
  static Widget verticalSpace6 = spacer(height: 6);
  static Widget verticalSpace8 = spacer(height: defaultPaddingLargeSize);
  static Widget verticalSpace10 = UIHelper.verticalSpaceSmall;
  static Widget verticalSpace12 = spacer(height: 12);
  static Widget verticalSpace20 = spacer(height: 20);

  static Widget verticalSpace16 = spacer(height: defaultPaddingVeryLargeSize);
  static Widget verticalSpace18 = spacer(height: 18);
  static Widget verticalSpace24 = spacer(height: 24);
  static Widget verticalSpace32 = spacer(height: 32);
  static Widget verticalSpace42 = spacer(height: 42);
}
