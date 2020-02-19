import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> headerWidgets(BuildContext context) => [
      Space(
        vertical: 24,
      ),
      Text(
        "Sign Up With Access Code",
        style: boldLabelTextStyle(17.0, null),
      ),
      Space(
        vertical: 10,
      ),
      Text(
        "Enter access code from the invite sent by your organization",
        style: normalLabelTextStyle(14.0, regularTextColor),
      ),
      Space(
        vertical: 24,
      ),
    ];
