import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/space.dart';

class SlotWidgetView extends StatelessWidget {
  SlotWidgetView(
      {Key key,
      this.onTap,
      this.height = 83,
      this.width = 126,
      this.slotDate,
      this.location,
      this.practice,
      this.timeTextStyle,
      this.dateTextStyle,
      this.practiceNameStyle})
      : super(key: key);
  final Function onTap;
  final double height;
  final double width;
  final DateTime slotDate;
  final String location;
  final String practice;
  final TextStyle dateTextStyle;
  final TextStyle timeTextStyle;
  final TextStyle practiceNameStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: enabledBtnTextColor, borderRadius: BorderRadius.circular(8), boxShadow: [
          BoxShadow(color: separatorColor.withOpacity(0.5), spreadRadius: 3, blurRadius: 2.0, offset: Offset(1.5, 2))
        ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: <Widget>[
                Text(
                  "${scDateFormat(slotDate)}".toUpperCase(),
                  style: (dateTextStyle != null) ? dateTextStyle : boldLabelTextStyle(12, labelTextStyleTextColor),
                ),
                Space(
                  vertical: 4,
                ),
                Text(
                  "${scTimeFormatSingleLetter(slotDate)}",
                  style: (timeTextStyle != null) ? timeTextStyle : boldLabelTextStyle(21, regularTextColor),
                ),
                Space(
                  vertical: 4,
                ),
                Spacer(),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ScripsIcons.instance.icon(
                        (location == appointmentLocationOffice)
                            ? ScripsIcons.office
                            : (location == appointmentLocationVirtual)
                                ? ScripsIcons.virtual
                                : ScripsIcons.home,
                        size: 13,
                        color: blueColor,
                      ),
                      Space(
                        horizontal: 2,
                      ),
                      Flexible(
                        child: Text(
                          (location == appointmentLocationOffice)
                              ? "${practice ?? ""}"
                              : (location == appointmentLocationVirtual)
                                  ? "Virtual"
                                  : "Home",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: (practiceNameStyle != null)
                              ? practiceNameStyle
                              : normalLabelTextStyle(13, regularTextColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
