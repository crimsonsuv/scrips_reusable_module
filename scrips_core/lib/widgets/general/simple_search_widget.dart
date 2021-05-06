import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/helper/background_helper.dart';

class SimpleSearchWidget extends StatefulWidget {
  final bool showIcon;
  final bool autoFocus;
  final String defaultText;
  final String placeholder;
  final ValueChanged<String> callback;

  const SimpleSearchWidget(
      {Key key,
      this.defaultText = "",
      this.showIcon = true,
      this.autoFocus = true,
      this.placeholder = "Search",
      this.callback})
      : super(key: key);

  @override
  _SimpleSearchWidgetState createState() => _SimpleSearchWidgetState();
}

class _SimpleSearchWidgetState extends State<SimpleSearchWidget> {
  TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.defaultText);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      decoration: searchBackgroundDecoration(),
      constraints: BoxConstraints.expand(height: 36),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (widget.showIcon)
            Row(
              children: <Widget>[
                SizedBox(
                    height: 24,
                    width: 24,
                    child: ScripsIcons.instance
                        .icon(ScripsIcons.search, color: Color(0xffdadada))),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                ),
              ],
            ),
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: widget.autoFocus,
              style: normalLabelTextStyle(15, regularTextColor),
              decoration: InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.only(
                  bottom: 12,
                ),
                hintText: widget.placeholder,
                hintStyle: defaultHintStyle(null, null),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                widget.callback(value);
                setState(() {});
              },
            ),
          ),
          if (controller.text != null && controller.text.isNotEmpty)
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 6)),
                GestureDetector(
                    onTap: () {
                      controller.clear();
                      widget.callback("");
                    },
                    child: SizedBox(
                        height: 24,
                        width: 24,
                        child: ScripsIcons.instance.icon(ScripsIcons.cancelled,
                            color: Color(0xffdadada)))),
              ],
            ),
        ],
      ),
    );
  }
}
