import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/home_tab/tab_item.dart';

class TabWidget extends StatelessWidget {
  final double width;
  final TabController tabController;
  final double height;
  final bool isScrollable;
  final List<TabItem> tabs;

  const TabWidget(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.isScrollable,
      @required this.tabController,
      @required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        labelStyle: normalBoldTextStyle(13, labelTextStyleTextColor,
            letterSpacing: -0.02),
        isScrollable: false,
        unselectedLabelColor: labelTextStyleTextColor,
        labelPadding: EdgeInsets.zero,
        labelColor: labelTextStyleTextColor,
        indicatorColor: Colors.transparent,
        tabs: tabs.map((TabItem choice) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  choice.icon ?? choice.icon,
                  choice.title != null
                      ? Text(
                          choice.title,
                        )
                      : Container(),
                ],
              ),
              if (choice.count != null)
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Center(
                      child: new Container(
                        padding: EdgeInsets.all(1),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: new Text(
                          choice.count,
                          style: boldLabelTextStyle(13, Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
