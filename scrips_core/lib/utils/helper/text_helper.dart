import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_sizes.dart';
import 'package:scrips_core/utils/helper/text_style_helper.dart';

import 'background_helper.dart';

Widget greenBackgroundText(String text,
        {double size = labelTextSize, EdgeInsets padding}) =>
    greenTextBackground(
        Text(
          text,
          style: whiteColorNormalTextStyle(size: size),
        ),
        padding: padding);

Widget coloredBackgroundText(String text,
        {Color bgColor, double size = labelTextSize, EdgeInsets padding}) =>
    textWithColoredBackground(
        Text(
          text,
          style: whiteColorNormalTextStyle(size: size),
        ),
        bgColor: bgColor,
        padding: padding);
