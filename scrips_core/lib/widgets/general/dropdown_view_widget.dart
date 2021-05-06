import 'package:flutter/material.dart';

class DropDownView extends StatelessWidget {
  final Widget child;
  final Widget dropDownChild;
  final String tooltipText;
  DropDownView({this.child, this.dropDownChild, this.tooltipText = "Show Options"});

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: PopupMenuButton<String>(
        tooltip: tooltipText,
        offset: Offset(0,60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        enableFeedback: false,
        onSelected: null,
        child: IgnorePointer(
          ignoring: true,
          child: child,
        ),
        itemBuilder: (BuildContext context) {
          return [PopupMenuItem(
              child: InkWell(onTap: (){},child: dropDownChild))];
        },
      ),
    );
  }
}