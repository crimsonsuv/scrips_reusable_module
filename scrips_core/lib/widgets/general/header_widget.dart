import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/widgets/general/divider_line.dart';

Widget headerWidget(BuildContext context,
    {Widget title,
    Color backgroundColor = Colors.white,
    bool isCenter = true,
    List<Widget> actions,
    bool showDivider = true,
    Widget isBack}) {
  return PreferredSize(
    preferredSize:
        Size(MediaQuery.of(context).size.width, (showDivider) ? 57 : 56),
    child: Column(
      children: [
        AppBar(
          brightness: Brightness.light,
          elevation: 0,
          leadingWidth: 40,
          automaticallyImplyLeading: isBack != null ? true : false,
          title: title ?? title,
          centerTitle: isCenter,
          backgroundColor: backgroundColor,
          leading: isBack ?? isBack,
          actions: actions ?? actions,
        ),
        (showDivider) ? DividerLine() : Container()
      ],
    ),
  );
}
