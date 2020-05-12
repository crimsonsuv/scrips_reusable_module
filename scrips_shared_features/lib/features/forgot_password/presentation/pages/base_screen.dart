import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';

import 'forgot_password_screen.dart';

class ForgotPasswordBaseScreen extends StatefulWidget {
  const ForgotPasswordBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _ForgotPasswordBaseScreenState createState() =>
      _ForgotPasswordBaseScreenState();
}

class _ForgotPasswordBaseScreenState extends State<ForgotPasswordBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: ForgotPasswordScreen(),
    );
  }
}
