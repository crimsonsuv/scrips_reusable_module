import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

List<Widget> headerWidgets(BuildContext context) => [
      Space(
        vertical: 12,
      ),
      Text(
        "Hey Dr Jack,",
        style: boldLabelTextStyle(17, textInputColor),
      ),
      Space(
        vertical: 16,
      ),
      Text(
        "Welcome to Dubai Primary Clinic on Scrips.",
        style: normalLabelTextStyle(15, regularTextColor),
      ),
      Space(
        vertical: 16,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: normalLabelTextStyle(15, regularTextColor),
          text: "Please, complete your registration for your",
          children: <TextSpan>[
            TextSpan(
                text: ' jacksmith@dubaiprimary.ae\n',
                style: boldLabelTextStyle(15, regularTextColor)),
            TextSpan(
              text: 'account by creating a password.',
              style: normalLabelTextStyle(15, regularTextColor),
            )
          ],
        ),
      ),
      Space(
        vertical: 24,
      ),
    ];
