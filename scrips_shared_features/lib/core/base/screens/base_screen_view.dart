import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/util/device_screen_type.dart';

/// Provide different designs for [mobile], [tablet] and [desktop] devices
///
/// In case that there is no available designs for [tablet] and [desktop], [mobile] design will be
/// set by default. Mobile design is only one required
///
class BaseScreenView extends StatelessWidget {
  final Widget mobileBodyLandscape;
  final Widget tabletBodyPortrait;
  final Widget desktopBodyPortrait;
  final Widget desktopBodyLandscape;
  final Widget mobileBodyPortrait;
  final Widget tabletBodyLandscape;

  const BaseScreenView({
    Key key,
    this.mobileBodyPortrait,
    this.mobileBodyLandscape,
    this.desktopBodyPortrait,
    @required this.desktopBodyLandscape,
    this.tabletBodyPortrait,
    this.tabletBodyLandscape,
  }) : assert(desktopBodyLandscape != null);

  @override
  Widget build(BuildContext context) {
    return DeviceLayout(
      desktop: OrientationType(
        portrait: desktopBodyPortrait ?? desktopBodyLandscape,
        landscape: desktopBodyLandscape,
      ),
      tablet: OrientationType(
        portrait: tabletBodyPortrait ?? desktopBodyLandscape,
        landscape: tabletBodyLandscape ?? desktopBodyLandscape,
      ),
      mobile: OrientationType(
        portrait: mobileBodyPortrait ?? desktopBodyLandscape,
        landscape: mobileBodyPortrait ?? desktopBodyLandscape,
      ),
    );
  }
}
