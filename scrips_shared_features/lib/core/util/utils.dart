import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void goToHome({BuildContext context, LoginUserData userData}) {
  Future.delayed(Duration(milliseconds: 100), () {
    SharedPreferences.getInstance().then((sp) {
      sp.setString('scripsUserData', jsonEncode(userData.toJson()));
      Navigator.pushNamed(context, AppRoutePaths.Home, arguments: userData);
    });
  });
}
