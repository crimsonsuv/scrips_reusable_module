import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/base/screens/base_screen_view.dart';

import 'create_password_screen.dart';

class CreatePasswordBaseScreen extends StatefulWidget {
  const CreatePasswordBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreatePasswordBaseScreenState createState() =>
      _CreatePasswordBaseScreenState();
}

class _CreatePasswordBaseScreenState extends State<CreatePasswordBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: CreatePasswordScreen(),
    );
  }
}
