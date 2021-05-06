import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/utils/device_screen_type.dart';

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
  final Function onBack;

  const BaseScreenView({
    Key key,
    this.mobileBodyPortrait,
    this.mobileBodyLandscape,
    this.desktopBodyPortrait,
    @required this.desktopBodyLandscape,
    this.tabletBodyPortrait,
    this.tabletBodyLandscape,
    this.onBack,
  }) : assert(desktopBodyLandscape != null);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(onBack!=null)onBack();
        return false;
      },
      child: DeviceLayout(
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
      ),
    );
  }
}
