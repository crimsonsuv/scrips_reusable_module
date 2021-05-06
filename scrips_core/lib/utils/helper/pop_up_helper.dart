import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/utils/helper/spacer_helper.dart';
import 'package:scrips_core/utils/helper/text_style_helper.dart';

import '../helper/button_helper.dart';
import '../helper/lines_helper.dart';

abstract class BasePopupWidget extends StatelessWidget {
  final double maxHeight;

  const BasePopupWidget({Key key, this.maxHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: isBigPopUp
              ? (maxHeight ?? MediaQuery.of(context).size.height * .8)
              : double.maxFinite),
      child: Container(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            header(context),
            separator(),
            isBigPopUp
                ? Expanded(
                    child: body(context),
                  )
                : body(context)
          ],
        ),
      ),
    );
  }

  double get width => 340;

  bool get isBigPopUp => true;

  Widget header(BuildContext context);

  Widget body(BuildContext context);

  String title(BuildContext context);

  Widget separator() => horizontalLine(color: separatorColor);
}

class PopupWidget extends BasePopupWidget {
  const PopupWidget({Key key, double maxHeight})
      : super(key: key, maxHeight: maxHeight);

  Widget body(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: isBigPopUp
                ? (maxHeight ?? MediaQuery.of(context).size.height * .8)
                : double.maxFinite),
        child: Container(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header(context),
              separator(),
              isBigPopUp
                  ? Expanded(
                      child: body(context),
                    )
                  : body(context)
            ],
          ),
        ),
      );

  Widget header(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title(context),
                style: popupHeaderTitleStyle(),
              ),
            ),
            SpaceHelper.horizontalSpace24,
            scripsIconButton(ScripsIcons.cross, size: 20, color: crossIconColor,
                callback: () {
              onCrossButtonClick(context);
            }),
            SpaceHelper.horizontalSpace12,
            scripsIconButton(ScripsIcons.check, size: 20, color: tickIconColor,
                callback: () {
              onTickButtonClick(context);
            }),
          ],
        ),
      );

  String title(BuildContext context) => "";

  Widget separator() => horizontalLine(color: separatorColor);

  void onTickButtonClick(BuildContext context) {}

  void onCrossButtonClick(BuildContext context) {}
}

class PopUpWidgetStatefulState<W extends StatefulWidget> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: isBigPopUp
              ? MediaQuery.of(context).size.height * .8
              : double.maxFinite),
      child: Container(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            header(context),
            separator(),
            isBigPopUp
                ? Expanded(
                    child: body(context),
                  )
                : body(context)
          ],
        ),
      ),
    );
  }

  double get width => 340;

  bool get isBigPopUp => true;

  Widget header(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title(context),
                style: popupHeaderTitleStyle(),
              ),
            ),
            SpaceHelper.horizontalSpace24,
            scripsIconButton(ScripsIcons.cross, size: 20, color: crossIconColor,
                callback: () {
              onCrossButtonClick(context);
            }),
            SpaceHelper.horizontalSpace12,
            scripsIconButton(ScripsIcons.check, size: 20, color: tickIconColor,
                callback: () {
              onTickButtonClick(context);
            }),
          ],
        ),
      );

  Widget body(BuildContext context) => Container();

  String title(BuildContext context) => "";

  Widget separator() => horizontalLine(color: separatorColor);

  void onTickButtonClick(BuildContext context) {}

  void onCrossButtonClick(BuildContext context) {}
}
