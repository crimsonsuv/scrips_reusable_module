import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

class FormView extends StatelessWidget {
  final String header;
  final String subtitle;
  final String headerButtonText;
  final TextStyle headerButtonStyle;
  final TextStyle subtitleStyle;
  final Color headerButtonColor;
  final Widget child;
  final EdgeInsets margin;
  final bool isMandatory;
  final Color backgroundColor;
  final Function onHeaderButtonTap;
  //
  FormView({
    Key key,
    this.header,
    this.subtitleStyle,
    this.subtitle,
    this.margin = const EdgeInsets.all(0),
    this.headerButtonText = "",
    this.headerButtonStyle,
    this.onHeaderButtonTap,
    @required this.child,
    this.backgroundColor = Colors.white,
    this.headerButtonColor,
    this.isMandatory = false,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        (header == null)
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(children: <Widget>[
                    Text(
                      "${this.header}",
                      style: boldLabelTextStyle(12, textInputColor),
                    ),
                    isMandatory
                        ? Text(
                            ' *',
                            style: boldLabelTextStyle(12, red),
                            textAlign: TextAlign.start,
                          )
                        : Container(),
                    Expanded(
                      child: Container(),
                    ),
                    (headerButtonText != '')
                        ? InkWell(
                            onTap: onHeaderButtonTap,
                            child: Text(
                              "$headerButtonText",
                              style: (headerButtonStyle != null)
                                  ? headerButtonStyle
                                  : normalBoldTextStyle(13,
                                      headerButtonColor ?? enabledBtnBGColor),
                            ),
                          )
                        : Container()
                  ]),
                  (subtitle == null)
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Space(
                              vertical: 8,
                            ),
                            Text(
                              "${this.subtitle}",
                              style: (this.subtitleStyle != null) ? subtitleStyle : semiBoldLabelTextStyle(
                                  13, labelTextStyleTextColor),
                            ),
                          ],
                        ),
                  Space(
                    vertical: 12,
                  ),
                ],
              ),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: this.margin,
            child: this.child,
          ),
        )
      ],
    );
  }
}
