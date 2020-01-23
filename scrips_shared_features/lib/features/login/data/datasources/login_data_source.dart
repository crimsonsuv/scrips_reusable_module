import 'package:flutter/cupertino.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/forgot_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_by_code_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/post.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/reset_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/set_password_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataSource {
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password});

  Future<http.Response> forgotPassword(ForgotPasswordModel forgotPasswordModel);

  Future<http.Response> register(RegisterModel registerModel);

  Future<http.Response> loginByCode(LoginByCode loginByCode);

  Future<http.Response> resetPassword(ResetPasswordModel resetPasswordModel);

  Future<http.Response> setPassword(SetPasswordModel setPasswordModel);

  Future<http.Response> loginToIdentityServer();
}
