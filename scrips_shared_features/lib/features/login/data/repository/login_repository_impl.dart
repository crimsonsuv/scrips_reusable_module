import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({@required this.loginDataSource});

  @override
  Future<Either<Failure, LoginUserData>> oauth2Login() async {
    try {
      final result = await loginDataSource.oauth2Login();
      if (currentAppType == AppType.UK) {
        if (result.role == "3") {
          return Left(Failure(
              "You are not authorized to use Practice Management App, try using other Scrips Apps"));
        } else {
          return Right(result);
        }
      } else if (currentAppType == AppType.PA) {
        if (result.role == "0" || result.role == "1" || result.role == "2") {
          return Left(Failure(
              "You are not authorized to use Provider App, try using other Scrips Apps"));
        } else {
          return Right(result);
        }
      } else {
        return Right(result);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        return Left(Failure(
            "Your account is archived or inactive, please contact Scrips."));
      }
      if (e.response.statusCode == 400) {
        return Left(Failure("Invalid Email Address or Incorrect Password"));
      }
      if (e.response.statusCode == 404) {
        return Left(Failure("Authorization failed from server"));
      }
      return (Left(handleFailure(e)));
    } on Failure catch (f) {
      return Left(f);
    } on PlatformException {
      return Left(Failure('Login Process Interrupted!'));
    }
  }

  @override
  Future<Either<Failure, LoginUserData>> getLoginResponse(
      String email, String password) async {
    try {
      final result =
          await loginDataSource.login(userName: email, password: password);
      if (currentAppType == AppType.UK) {
        if (result.role == "3") {
          return Left(Failure(
              "You are not authorized to use Practice Management App, try using other Scrips Apps"));
        } else {
          return Right(result);
        }
      } else if (currentAppType == AppType.PA) {
        if (result.role == "0" || result.role == "1" || result.role == "2") {
          return Left(Failure(
              "You are not authorized to use Provider App, try using other Scrips Apps"));
        } else {
          return Right(result);
        }
      } else {
        return Right(result);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        return Left(Failure(
            "Your account is archived or inactive, please contact Scrips."));
      }
      if (e.response.statusCode == 400) {
        return Left(Failure("Invalid Email Address or Incorrect Password"));
      }
      if (e.response.statusCode == 404) {
        return Left(Failure("Authorization failed from server"));
      }
      return (Left(handleFailure(e)));
    } on Failure catch (f) {
      return Left(f);
    } on PlatformException {
      return Left(Failure('Login Process Interrupted!'));
    }
  }
}
