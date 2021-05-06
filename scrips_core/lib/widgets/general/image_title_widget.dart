import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/helper/button_helper.dart';
import 'package:scrips_core/utils/helper/spacer_helper.dart';

class ImageTitleWidget extends StatelessWidget {
  final String title;
  final int icon;
  final Color color;
  final double size;
  final TextStyle textStyle;

  const ImageTitleWidget({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.color,
    this.size,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: size ?? 24,
            height: size ?? 24,
            decoration: BoxDecoration(
                color: color ?? scripsPrimaryLightBlueColor,
                borderRadius: BorderRadius.circular(6)),
            child: scripsIconButton(icon,
                color: Colors.white, size: (size ?? 24) * 0.75),
          ),
          SpaceHelper.horizontalSpace16,
          Text(
            title ?? "",
            style: textStyle ?? boldLabelTextStyle(12, scripsTitleBlueColor),
          )
        ],
      );
}
