import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';
import 'package:scrips_shared_features/features/create_password/domain/repository/create_password_repository.dart';
import 'package:dio/dio.dart';

class CreatePasswordRepositoryImpl extends CreatePasswordRepository {
  CreatePasswordDataSource createPasswordDataSource;

  CreatePasswordRepositoryImpl({@required this.createPasswordDataSource});

  @override
  Future<Either<Failure, Success>> setPassword(
      {String email, String password, String passwordResetToken}) async {
    try {
      final result = await createPasswordDataSource.setPassword(
          email: email,
          password: password,
          passwordResetToken: passwordResetToken);
      return Right(result);
    } on DioError catch (e) {
      if (e.response.statusCode == 400) {
        return Left(Failure("Password Reset token expired, Please try again"));
      }
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
