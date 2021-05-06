import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/helper/button_helper.dart';
import 'package:scrips_core/utils/helper/text_style_helper.dart';

class IconHelper {
  static Widget greenCheckIcon() => scripsCircularIconButton(ScripsIcons.check,
      size: 7,
      color: Colors.white,
      background: successTabColor,
      elevation: 0,
      padding: EdgeInsets.all(2));

  static Widget doneButton({double size, VoidCallback callback, Color color = tickIconColor}) =>
      scripsIconButton(ScripsIcons.check,
          color: color, callback: callback);

  static Widget cancelButton({double size, VoidCallback callback}) =>
      scripsIconButton(ScripsIcons.cross,
          color: crossIconColor, callback: callback);

  static Widget editButton({double size, VoidCallback callback}) =>
      scripsIconButton(ScripsIcons.edit,
          size: size, color: scripsPrimaryLightBlueColor, callback: callback);

  static Widget deleteButton({double size, VoidCallback callback}) =>
      scripsIconButton(ScripsIcons.delete,
          size: size, color: deleteIconColor, callback: callback);

  static Widget addButton({double size, VoidCallback callback}) =>
      scripsIconButton(ScripsIcons.plus,
          size: size, color: scripsPrimaryLightBlueColor, callback: callback);

  static Widget drugInteractionIcon({double size = 20}) =>  Tooltip(
      message: "Drug Interaction",
      child:Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Color(0xffD2FF52), borderRadius: BorderRadius.circular(6)),
      child: ScripsIcons.instance
          .icon(ScripsIcons.drugInteraction, size: size, color: Colors.black)));

  static Widget rxIcon({double size}) => Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          color: Color(0xfff7f7f7), borderRadius: BorderRadius.circular(2)),
      child: Text(
        "Rx",
        style: boldLabelTextStyle(size, scripsTitleBlueColor),
      ));

  static Widget favouriteButton(bool filled,
          {double size, Color color, VoidCallback callback}) =>
      scripsIconButton(filled ? ScripsIcons.starFilled : ScripsIcons.starEmpty,
          size: size,
          color: color ?? scripsPrimaryLightBlueColor,
          callback: callback);
}
