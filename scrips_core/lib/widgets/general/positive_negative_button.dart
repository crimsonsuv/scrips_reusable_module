import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/design.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/helper/button_helper.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/scrips_shared_public.dart';

class PositiveNegativeButton extends StatelessWidget {
  final String title;
  final PatientClinicalItemStatus value;
  final ValueChanged<PatientClinicalItemStatus> callback;

  const PositiveNegativeButton({Key key, this.title, this.value, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.transparent;
    var color = scripsPrimaryLightBlueColor;

    if (value != null) {
      if (value == PatientClinicalItemStatus.pos) {
        color = designColor2;
        borderColor = color;
      } else if (value == PatientClinicalItemStatus.neg) {
        color = designColor4;
        borderColor = color;
      }
    }

    return Container(
      height: 24,
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color: lightGrey,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          positiveButton(value != PatientClinicalItemStatus.neg, color),
          Space(
            horizontal: 9,
          ),
          titleWidget(),
          Space(
            horizontal: 9,
          ),
          negativeButton(value != PatientClinicalItemStatus.pos, color)
        ],
      ),
    );
  }

  Widget positiveButton(bool showIcon, color) =>
      button(ScripsIcons.plus, showIcon, color, () {
        callback(value == PatientClinicalItemStatus.pos
            ? PatientClinicalItemStatus.none
            : PatientClinicalItemStatus.pos);
      });

  Widget negativeButton(bool showIcon, color) =>
      button(ScripsIcons.minus, showIcon, color, () {
        callback(value == PatientClinicalItemStatus.neg
            ? PatientClinicalItemStatus.none
            : PatientClinicalItemStatus.neg);
      });

  Widget button(int icon, bool showIcon, color, callback) => Container(
      height: 14,
      width: 14,
      child: showIcon
          ? scripsIconButton(icon,
              color: color,
              size: 12,
              paddingMultiplier: true,
              callback: callback)
          : Container());

  Widget titleWidget() => Text(
        title,
        style: normalLabelTextStyle(13, scripsTextBlueColor),
      );
}
