import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/base/screens/base_screen_view.dart';
import 'package:scrips_shared_features/features/reset_password_access_code/presentation/pages/reset_password_access_code_screen.dart';

class ResetPasswordAccessCodeBaseScreen extends StatefulWidget {
  const ResetPasswordAccessCodeBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _ResetPasswordAccessCodeBaseScreenState createState() =>
      _ResetPasswordAccessCodeBaseScreenState();
}

class _ResetPasswordAccessCodeBaseScreenState
    extends State<ResetPasswordAccessCodeBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: ResetPasswordAccessCodeScreen(),
    );
  }
}
