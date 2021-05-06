import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';

class AnswerTopButtonsWidget extends StatefulWidget {
  AnswerTopButtonsWidget(
      {Key key, this.title = "", this.onDelete, this.onEdit, this.image})
      : super(key: key);
  final String title;
  final Function onEdit;
  final Function onDelete;
  final Image image;

  @override
  _AnswerTopButtonsWidgetState createState() => _AnswerTopButtonsWidgetState();
}

class _AnswerTopButtonsWidgetState extends State<AnswerTopButtonsWidget> {
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: enabledBtnTextColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                  color: bgColor, height: 32, width: 32, child: widget.image),
            ),
            Space(
              horizontal: 16,
            ),
            Expanded(
              child: Text(
                "${widget.title}",
                style: boldLabelTextStyle(12, labelTextStyleTextColor),
              ),
            ),
            Space(
              horizontal: 16,
            ),
            Button(
              height: 32,
              width: 72,
              buttonBackgroundColor: bgColor,
              style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
              text: "Edit",
              onPressed: () {
                widget.onEdit();
              },
            ),
            Space(
              horizontal: 16,
            ),
            InkWell(
                onTap: () {
                  widget.onDelete();
                },
                child: Images.instance.deleteIcon()),
          ],
        ));
  }
}
