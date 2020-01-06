import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';

List<Widget> headerWidgets(BuildContext context) => [
      Space(
        vertical: 24,
      ),
      Text(
        S.of(context).welcome_to_scrips_practice_management,
        style: boldLabelTextStyle(17.0, null),
      ),
      Space(
        vertical: 10,
      ),
      Text(S.of(context).please_enter_your_login_details,
          textAlign: TextAlign.center,
          style: normalLabelTextStyle(15.0, regularTextColor)),
      Space(
        vertical: 24,
      ),
    ];
