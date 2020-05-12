import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';

import 'login_screen.dart';

class LoginBaseScreen extends StatefulWidget {
  const LoginBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginBaseScreenState createState() => _LoginBaseScreenState();
}

class _LoginBaseScreenState extends State<LoginBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: Login(),
    );
  }
}
