import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

List<Widget> headerWidgets({BuildContext context}) => [
      Space(
        vertical: 24,
      ),
      Text(
        S.of(context).welcomeTo +
            " Scrips® ${getCurrentAppName(context, S.of(context))}",
        style: boldLabelTextStyle(17, textInputColor),
      ),
      Space(
        vertical: 10,
      ),
      Text(
        "Log in or sign up to get started",
        style: normalLabelTextStyle(15, regularTextColor),
      ),
    ];
