import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/forgot_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_by_code_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:http/http.dart' as http;
import 'package:scrips_shared_features/features/login/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/reset_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/set_password_model.dart';

abstract class LoginRepository {
  Future<Either<ErrorClass, LoginResponse>> getLoginResponse(
      BuildContext context, String email, String password);

  Future<http.Response> getResetPasswordResponse(
      ResetPasswordModel resetPasswordModel);

  Future<http.Response> getForgotPasswordResponse(
      ForgotPasswordModel forgotPasswordModel);

    Future<http.Response> getLoginByCodeResponse(LoginByCode loginByCodeModel);

  Future<http.Response> getRegisterResponse(RegisterModel registerdModel);

  Future<http.Response> getSetPasswordResponse(
      SetPasswordModel setPasswordModel);
}
