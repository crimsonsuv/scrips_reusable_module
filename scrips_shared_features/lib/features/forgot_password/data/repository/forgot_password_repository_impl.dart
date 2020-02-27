import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/forgot_password/data/datasource/forgot_password_data_source.dart';
import 'package:scrips_shared_features/features/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  ForgotPasswordDataSource forgotPasswordDataSource;

  ForgotPasswordRepositoryImpl({@required this.forgotPasswordDataSource});

  @override
  Future<Either<Failure, Success>> forgotPassword(
      {String email, String password, String passwordResetToken}) async {
    try {
      final result = await forgotPasswordDataSource.forgotPassword(
        email: email,
      );
      return Right(result);
    } on DioError catch (e) {
      if (e.response.statusCode == 400) {
        return (Left(
            Failure("Code generated recently, please try after some time")));
      }
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
