import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

typedef void StringCallback(String text);
typedef void VoidCallback();

class CustomTabBarWidget extends StatefulWidget {
  CustomTabBarWidget({Key key, this.option1, this.option2, this.controller})
      : super(key: key);
  final String option1;
  final String option2;
  final TabController controller;

  @override
  _CustomTabBarWidgetState createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = <Widget>[
    new Tab(text: ""),
    new Tab(text: ""),
  ];

  @override
  void dispose() async {
    super.dispose();
    //isEmpty.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = <Widget>[
      new Tab(text: widget.option1),
      new Tab(text: widget.option2),
    ];
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
              labelStyle: semiBoldLabelTextStyle(13, blackColor),
              unselectedLabelColor: blackColor,
              unselectedLabelStyle: semiBoldLabelTextStyle(13, blackColor),
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
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
