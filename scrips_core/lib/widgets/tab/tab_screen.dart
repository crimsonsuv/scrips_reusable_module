import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/divider_line.dart';
import 'package:scrips_core/widgets/tab/tab_item.dart';
import 'package:scrips_core/widgets/tab/tab_widget.dart';

/////////

class TabScreen extends StatefulWidget {
  final List<TabItem> tabs;
  final TabController tabController;
  final bool isLoading;
  final bool showTopBar;
  final TextStyle titleStyle;
  final double spacing;
  final Widget titleHeader;

  TabScreen(
      {Key key,
      this.tabs,
      this.tabController,
      this.isLoading = false,
      this.showTopBar = true,
      this.titleStyle,
      this.titleHeader,
      this.spacing = 8})
      : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if(!mounted) return;
      if (widget.tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = widget.tabs;
    return Container(
      color: bgColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: (widget.showTopBar == false)
                        ? Container()
                        : Row(
                            children: [
                              Expanded(
                                child: TabWidget(
                                  tabController: widget.tabController,
                                  tabs: tabs,
                                  spacing: widget.spacing,
                                  titleStyle: widget.titleStyle,
                                ),
                              ),
                            ],
                          )),
                widget.titleHeader != null ? widget.titleHeader : Container(),
              ],
            ),
            widget.isLoading
                ? SizedBox(
                    height: 1,
                    child: LinearProgressIndicator(
                      backgroundColor: enabledBtnBGColor.withOpacity(0.2),
                    ),
                  )
                : DividerLine(),
            Expanded(
              child:  widget.tabs[widget.tabController.index].view,
            ),
          ]),
    );
  }
}
