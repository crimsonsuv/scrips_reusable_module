import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
import 'package:scrips_core/widgets/general/always_visble_scrollbar.dart';
import 'package:scrips_core/widgets/general/button.dart';

class SimpleView extends StatelessWidget {
  final bool showBackButton;
  final bool showAppIcon;
  final bool showNext;
  final String nextBtnTitle;
  final Image iconImage;
  final Function onBack;
  final Function onNext;
  final List<Widget> headerWidgets;
  final List<Widget> bodyWidgets;
  final List<Widget> footerWidgets;
  final String validationMessage;

  final _maxFieldWidth = 548.0;

  SimpleView(
      {Key key,
      @required this.showBackButton,
      @required this.showAppIcon,
      this.onBack,
      this.showNext = true,
      this.iconImage,
      this.nextBtnTitle = 'Next',
      this.onNext,
      @required this.headerWidgets,
      @required this.bodyWidgets,
      @required this.footerWidgets,
      this.validationMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            color: bgColor,
          ),
          padding:
              EdgeInsets.only(left: 0.0, top: 10.0, bottom: 8.0, right: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showBackButton
                      ? Button(
                          height: 40,
                          width: 85,
                          text: "Back",
                          buttonBackgroundColor: bgColor,
                          style: boldLabelTextStyle(16.0, enabledBtnBGColor),
                          onPressed: () {
                            Navigator.pop(context);
                            if (this.onBack != null) {
                              this.onBack();
                            }
                          },
                        )
                      : Container(),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: math.min(
                          MediaQuery.of(context).size.width, _maxFieldWidth),
                      child:
                          SingleChildScrollViewWithScrollbar /*SingleChildScrollViewWithAlwaysVisibleScrollbar*/ (
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            showAppIcon
                                ? Container(
                                    //margin: EdgeInsets.only(left: 8.0, top: 30.0, bottom: 8.0, right: 8.0),
                                    child: iconImage,
                                  )
                                : Container(),
                            ...this.headerWidgets,
                            Container(
                              //margin: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [...this.bodyWidgets],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [...this.footerWidgets],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (this.showNext)
                  ? Container(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 48.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 400,
                              margin: EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
                              child: UIHelper.buildValidationMessage(context,
                                  validationMessage: validationMessage),
                            ),
                            SizedBox(
                              height: 48.0,
                              width: 200,
                              child: FlatButton(
                                color: disabledBtnBGColor,
                                textTheme: ButtonTextTheme.normal,
                                onPressed: () {
                                  if (this.onNext != null) {
                                    this.onNext();
                                  }
                                },
                                child: Text(this.nextBtnTitle,
                                    style: boldLabelTextStyle(
                                        14.0, disabledBtnTextColor)),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(24.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          )),
    );
  }
}
