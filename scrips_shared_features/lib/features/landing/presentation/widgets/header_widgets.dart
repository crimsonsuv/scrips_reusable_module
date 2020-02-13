import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> headerWidgets(BuildContext context) => [
      Space(
        vertical: 24,
      ),
      Text(
        "Welcome to Scrips® Practice Management",
        style: boldLabelTextStyle(17, textInputColor),
      ),
      Space(
        vertical: 10,
      ),
      Text(
        "Please, enter your login details",
        style: normalLabelTextStyle(15, regularTextColor),
      ),
    ];
