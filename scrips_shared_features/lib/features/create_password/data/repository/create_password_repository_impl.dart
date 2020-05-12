import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';
import 'package:scrips_shared_features/features/create_password/domain/repository/create_password_repository.dart';

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

  @override
  Future<Either<Failure, SignUpUserData>> signupUserData({String email}) async {
    try {
      final result =
          await createPasswordDataSource.signupUserData(email: email);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
