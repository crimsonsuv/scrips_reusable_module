import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';

import 'reset_password_new_password_screen.dart';

class ResetPasswordNewPasswordBaseScreen extends StatefulWidget {
  final Map<String, String> arguments;
  const ResetPasswordNewPasswordBaseScreen({
    this.arguments,
    Key key,
  }) : super(key: key);

  @override
  _ResetPasswordNewPasswordBaseScreenState createState() =>
      _ResetPasswordNewPasswordBaseScreenState();
}

class _ResetPasswordNewPasswordBaseScreenState
    extends State<ResetPasswordNewPasswordBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: ResetPasswordNewPasswordScreen(
        arguments: widget.arguments,
      ),
    );
  }
}
