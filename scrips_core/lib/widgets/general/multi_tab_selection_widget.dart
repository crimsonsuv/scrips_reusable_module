import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

typedef void StringCallback(String text);
typedef void VoidCallback();

class MultiTabBarWidget extends StatefulWidget {
  MultiTabBarWidget({Key key, this.options, this.controller}) : super(key: key);
  final List<String> options;
  final TabController controller;

  @override
  _MultiTabBarWidgetState createState() => _MultiTabBarWidgetState();
}

class _MultiTabBarWidgetState extends State<MultiTabBarWidget>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = [];

  @override
  void dispose() async {
    super.dispose();
    //isEmpty.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.options.forEach((data) {
      tabs.add(Tab(
        text: data,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: new TabBar(
              labelColor: blackColor,
              labelStyle: semiBoldLabelTextStyle(12, blackColor),
              unselectedLabelColor: blackColor,
              unselectedLabelStyle: normalLabelTextStyle(12, blackColor),
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.only(left: 0, right: 0),
              controller: widget.controller,
              indicator: BoxDecoration(
                color: enabledBtnTextColor,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 1.5)
                ],
              ),
              tabs: tabs,
            ),
          ),
        ),
      ],
    );
  }
}
