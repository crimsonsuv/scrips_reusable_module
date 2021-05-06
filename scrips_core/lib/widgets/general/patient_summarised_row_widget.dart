import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/circular_tooltip.dart';
import 'package:scrips_core/widgets/general/space.dart';

class PatientSummarisedRowWidget extends StatelessWidget {
  final String mrn;
  final String language;
  final String lastUpdated;
  final String status;
  //
  PatientSummarisedRowWidget(
      {Key key, this.mrn, this.status, this.language, this.lastUpdated})
      : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("PATIENT MRN: ".toUpperCase(),
                    style: boldLabelTextStyle(12.0, labelTextStyleTextColor)),
                Text('${mrn ?? "N/A"}',
                    style: normalLabelTextStyle(13.0, regularTextColor)),
                Space(
                  horizontal: 22,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Language: ".toUpperCase(),
                    style: boldLabelTextStyle(12.0, labelTextStyleTextColor)),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 120),
                  child: CircularTooltip(
                    message: '${language ?? "N/A"}',
                    child: Text(
                      '${language ?? "N/A"}',
                      style: normalLabelTextStyle(13.0, regularTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Space(
                  horizontal: 22,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Last Update: ".toUpperCase(),
                    style: boldLabelTextStyle(12.0, labelTextStyleTextColor)),
                Text('${lastUpdated ?? "N/A"}',
                    style: normalLabelTextStyle(13.0, regularTextColor)),
                Space(
                  horizontal: 22,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Status: ".toUpperCase(),
                    style: boldLabelTextStyle(12.0, labelTextStyleTextColor)),
                Text('${status ?? "N/A"}',
                    style: normalLabelTextStyle(13.0, regularTextColor)),
              ],
            ),
          ],
        ));
  }
}
