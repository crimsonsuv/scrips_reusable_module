import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Failure handleFailure(DioError e) {
  int responseCode = e.response.statusCode;
  if (isBetween(responseCode, 400, 499)) {
    return Failure("Request fields are missing.");
  } else if (isBetween(responseCode, 500, 599)) {
    return Failure(
        "Something bad happend in Server, please contact scrips support.");
  } else {
    return Failure(e?.message ?? "");
  }
}

void goToHome({BuildContext context, LoginUserData userData}) {
  Future.delayed(Duration(milliseconds: 100), () {
    SharedPreferences.getInstance().then((sp) {
      sp.setString('scripsUserData', jsonEncode(userData.toJson()));
      Navigator.pushNamed(context, AppRoutePaths.Home, arguments: userData);
    });
  });
}
