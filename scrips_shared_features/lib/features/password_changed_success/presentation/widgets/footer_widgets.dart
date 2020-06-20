import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/password_changed_success/presentation/bloc/bloc.dart';

List<Widget> footerWidgets(
        {BuildContext context,
        PasswordChangedSuccessBloc bloc,
        bool isLoading}) =>
    <Widget>[
      Space(vertical: 30),
      Button(
        width: 176.0,
        height: 48,
        text: "Log In",
        isLoading: isLoading,
        buttonBackgroundColor: normalBtnTextColor,
        onPressed: () {
          if (kIsWeb || Platform.isMacOS) {
            Future.delayed(Duration(milliseconds: 100), () {
              Navigator.pushNamed(context, AppRoutePaths.Login);
            });
          } else {
            bloc.add(OAuthLoginEvent());
          }
        },
        style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor),
      ),
    ];
