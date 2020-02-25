import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> headerWidgets(BuildContext context,
        [String title, String subtitle]) =>
    [
      Space(
        vertical: 24,
      ),
      Text(
        title.isEmpty || title == null
            ? "Welcome to Scrips® Practice Management"
            : title,
        style: boldLabelTextStyle(17.0, null),
      ),
      Space(
        vertical: 10,
      ),
      Text(
          subtitle.isEmpty || subtitle == null
              ? "Please enter your login details"
              : subtitle,
          textAlign: TextAlign.center,
          style: normalLabelTextStyle(15.0, regularTextColor)),
      Space(
        vertical: 24,
      ),
    ];
