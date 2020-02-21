import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> headerWidgets(BuildContext context) => [
      Space(
        vertical: 24,
      ),
      Text(
        "Your Password Is Set",
        style: boldLabelTextStyle(17, textInputColor),
      ),
      Space(
        vertical: 8,
      ),
      Text(
        "You can now log in with your new password",
        style: normalLabelTextStyle(15, regularTextColor),
      ),
      Space(
        vertical: 24,
      ),
    ];
