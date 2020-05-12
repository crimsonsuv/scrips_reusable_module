import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/pages/signup_with_access_code_screen.dart';

class SignUpBaseScreen extends StatefulWidget {
  const SignUpBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _SignUpBaseScreenState createState() => _SignUpBaseScreenState();
}

class _SignUpBaseScreenState extends State<SignUpBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: SignUpScreen(),
    );
  }
}
