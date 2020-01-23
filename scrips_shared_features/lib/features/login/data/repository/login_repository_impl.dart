import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/src/response.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/forgot_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_by_code_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/reset_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/set_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({@required this.loginDataSource});

  @override
  Future<Either<ErrorClass, LoginResponse>> getLoginResponse(
      BuildContext context, String email, String password) async {
    try {
      final result = await loginDataSource.login(context,
          userName: email, password: password);

      return Right(result);
    } on ServerError {
      return Left(ServerError());
    }
  }

  @override
  Future<Response> getForgotPasswordResponse(
      ForgotPasswordModel forgotPasswordModel) async {
    final result = await loginDataSource.forgotPassword(forgotPasswordModel);

    return result;
  }

  @override
  Future<Response> getLoginByCodeResponse(LoginByCode loginByCodeModel) async {
    final result = await loginDataSource.loginByCode(loginByCodeModel);
    return result;
  }

  @override
  Future<Response> getRegisterResponse(RegisterModel registerdModel) async {
    final result = await loginDataSource.register(registerdModel);
    return result;
  }

  @override
  Future<Response> getResetPasswordResponse(
      ResetPasswordModel resetPasswordModel) async {
    final result = await loginDataSource.resetPassword(resetPasswordModel);
    return result;
  }

  @override
  Future<Response> getSetPasswordResponse(
      SetPasswordModel setPasswordModel) async {
    final result = await loginDataSource.setPassword(setPasswordModel);
    return result;
  }
}
