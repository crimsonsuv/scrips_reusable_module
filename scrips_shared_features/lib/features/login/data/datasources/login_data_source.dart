import 'package:flutter/material.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';

abstract class LoginDataSource {
  Future<LoginTokens> oauth2Login();
  Future<UserData> login(BuildContext context,
      {String userName, String password});
}
