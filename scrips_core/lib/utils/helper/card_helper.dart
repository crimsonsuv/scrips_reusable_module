import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/app_sizes.dart';
import 'package:scrips_core/utils/helper/lines_helper.dart';
import 'package:scrips_core/utils/helper/spacer_helper.dart';

ShapeBorder defaultShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(13));

Widget circularCard(Widget child,
        {double size = defaultAvatarSize,
        EdgeInsets padding,
        Color color = Colors.white,
        double elevation = 2}) =>
    Container(
      height: size,
      width: size,
      child: Card(
          child: Padding(
            padding: padding,
            child: child,
          ),
          color: color,
          elevation: elevation,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          )),
    );

Widget defaultCard(
        {Widget child, double elevation = 0, EdgeInsets margin, Color color}) =>
    Card(
        child: child,
        color: color ?? Colors.white,
        elevation: elevation ?? 0,
        margin: margin ?? EdgeInsets.zero,
        shape: defaultShape,
        clipBehavior: Clip.antiAliasWithSaveLayer);

Widget highlighterCard({Widget widget, Color highlightColor}) => defaultCard(
    color: lightGrey,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: LayoutBuilder(
            builder: (context, constraint) {
              return Row(
                children: [
                  verticalLine(
                      width: 2,
                      height: constraint.maxHeight,
                      radius: 3,
                      color: highlightColor ?? blueColor),
                  Expanded(
                    child: Container(),
                  )
                ],
              );
            },
          )),
          SpaceHelper.horizontalSpace16,
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: widget ?? Container(),
          ),
        ],
      ),
    ));
