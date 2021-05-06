import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
Widget productTour(
    {@required BuildContext context,
    @required String featureId,
    @required Widget targetWidget,
    @required Widget description}) {
  return DescribedFeatureOverlay(
    featureId: featureId,
    contentLocation: ContentLocation.below,
    overflowMode: OverflowMode.extendBackground,
    tapTarget: Container(
      color: Colors.red,
      height: 0,
      width: 0,
    ),
    description: description,
    backgroundColor: vaccinesColor,
    backgroundOpacity: 0.9,
    targetColor: Colors.white,
    textColor: Colors.white,
    enablePulsingAnimation: false,
    pulseDuration: Duration(seconds: 0),
    child: targetWidget,
  );
}
