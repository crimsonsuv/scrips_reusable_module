import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

class TabBarOptionIndicatorWidget extends StatefulWidget {
  final Function onTap;
  final String title;
  final String subtitle;
  final bool isSuccess;
  final bool isSelected;

  TabBarOptionIndicatorWidget(
      {this.subtitle, this.title, this.isSelected, this.isSuccess, this.onTap});

  @override
  _TabBarOptionIndicatorWidgetState createState() =>
      _TabBarOptionIndicatorWidgetState();
}

class _TabBarOptionIndicatorWidgetState
    extends State<TabBarOptionIndicatorWidget> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 49.0,
        maxHeight: 49,
        maxWidth: 165,
        minWidth: 165,
      ),
      child: InkWell(
        onTap: () {
          //widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSuccess ? successTabColor : Colors.transparent,
            border: Border.all(
                width: 1,
                color: widget.isSuccess
                    ? successTabColor
                    : blackColor.withOpacity(0.05)),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.title}",
                      style: boldLabelTextStyle(
                          12.0,
                          widget.isSuccess
                              ? enabledBtnTextColor
                              : labelTextStyleTextColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                    ),
                    Text(
                      "${widget.subtitle}",
                      style: normalLabelTextStyle(
                          13.0,
                          widget.isSuccess
                              ? enabledBtnTextColor
                              : (widget.isSelected
                                  ? regularTextColor
                                  : defaultFieldHintColor)),
                      maxLines: null,
                    ),
                  ],
                ),
                Images.instance.successSmall(height: 24, width: 24)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
