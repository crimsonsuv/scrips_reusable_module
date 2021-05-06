import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/design.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_shared_features/scrips_shared_public.dart';

class NormalTag extends StatelessWidget {
  final String title;
  final PatientClinicalItemStatus value;
  final ValueChanged<PatientClinicalItemStatus> callback;

  const NormalTag({Key key, this.title, this.value, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 0;
    var colorBg = lightGrey;
    var colorText = scripsTextBlueColor;
    if (value == PatientClinicalItemStatus.yes) {
      colorText = Colors.white;
      colorBg = designColor1;
    }

    return GestureDetector(
      onTap: () {
        callback(value == PatientClinicalItemStatus.yes
            ? PatientClinicalItemStatus.none
            : PatientClinicalItemStatus.yes);
      },
      child: Container(
        height: 24,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: colorBg, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget(colorText),
          ],
        ),
      ),
    );
  }

  Widget titleWidget(Color color) => Text(
        title,
        style: normalLabelTextStyle(13, color),
      );
}
