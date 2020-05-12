import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';
import 'package:scrips_shared_features/features/password_changed_success/presentation/pages/password_changed_success_screen.dart';

class PasswordChangedSuccessBaseScreen extends StatefulWidget {
  const PasswordChangedSuccessBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _PasswordChangedSuccessBaseScreenState createState() =>
      _PasswordChangedSuccessBaseScreenState();
}

class _PasswordChangedSuccessBaseScreenState
    extends State<PasswordChangedSuccessBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: PasswordChangedSuccessScreen(),
    );
  }
}
