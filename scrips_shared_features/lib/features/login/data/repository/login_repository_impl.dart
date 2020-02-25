import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({@required this.loginDataSource});

  @override
  Future<Either<Failure, LoginTokens>> oauth2Login() async {
    try {
      final result = await loginDataSource.oauth2Login();

      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (f) {
      return Left(f);
    } on PlatformException {
      return Left(Failure('Login Process Interrupted!'));
    }
  }

  @override
  Future<Either<Failure, UserData>> getLoginResponse(
      BuildContext context, String email, String password) async {
    try {
      final result = await loginDataSource.login(context,
          userName: email, password: password);

      return Right(result);
    } on Failure catch (f) {
      return Left(f);
    }
  }
}
