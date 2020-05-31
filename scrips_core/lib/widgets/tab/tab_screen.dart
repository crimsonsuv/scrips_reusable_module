import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/divider_line.dart';
import 'package:scrips_core/widgets/general/screen_widget.dart';
import 'package:scrips_core/widgets/tab/tab_item.dart';
import 'package:scrips_core/widgets/tab/tab_widget.dart';

class TabScreen extends StatefulWidget {
  final List<TabItem> tabs;
  final TabController tabController;

  TabScreen({Key key, this.tabs, this.tabController}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = widget.tabs;
    return Scaffold(
      body: ScreenWidget(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
            color: bgColor,
            child: Column(children: <Widget>[
              TabWidget(
                width: constraints.maxWidth,
                tabController: widget.tabController,
                tabs: tabs,
              ),
              DividerLine(),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: widget.tabController,
                  children: widget.tabs.map((data) => data.view).toList(),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
