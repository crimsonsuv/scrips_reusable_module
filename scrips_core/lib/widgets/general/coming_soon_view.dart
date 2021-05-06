import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Coming Soon...",
          style: normalLabelTextStyle(14, labelTextStyleTextColor),
        ),
      ),
    );
  }
}
