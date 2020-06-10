import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/app_sizes.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/tab/tab_item.dart';

class TabWidget extends StatelessWidget {
  final double width;
  final TabController tabController;
  final List<TabItem> tabs;

  const TabWidget(
      {Key key,
      @required this.width,
      @required this.tabController,
      @required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 8),
      width: width,
      color: enabledBtnTextColor,
      child: TabBar(
        controller: tabController,
        labelStyle: semiBoldLabelTextStyle(hintTextSize, enabledBtnBGColor),
        isScrollable: true,
        unselectedLabelColor: disabledTabTextColor,
        labelColor: normalBtnTextColor,
        indicatorColor: Colors.transparent,
        tabs: tabs.map((TabItem choice) {
          return Row(
            children: <Widget>[
              Text(choice.title),
              (choice?.isUnsaved ?? false)
                  ? Row(
                      children: <Widget>[
                        Space(
                          horizontal: 4,
                        ),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
            // text: choice.title,
          );
        }).toList(),
      ),
    );
  }
}
