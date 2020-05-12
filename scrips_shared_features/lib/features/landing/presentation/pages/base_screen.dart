import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';

import 'landing_web_screen.dart';

class LandingBaseScreen extends StatefulWidget {
  const LandingBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _LandingBaseScreenState createState() => _LandingBaseScreenState();
}

class _LandingBaseScreenState extends State<LandingBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: LandingWebScreen(),
    );
  }
}
