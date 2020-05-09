import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';

class FormView extends StatelessWidget {
  final String header;
  final String subtitle;
  final Widget child;
  final EdgeInsets margin;
  final bool isMandatory;
  //
  FormView({
    Key key,
    this.header,
    this.subtitle,
    @required this.margin,
    @required this.child,
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
                              style: semiBoldLabelTextStyle(
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
            color: disabledBtnTextColor,
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
