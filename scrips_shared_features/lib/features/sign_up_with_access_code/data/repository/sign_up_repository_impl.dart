import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/repository/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  SignUpDataSource signUpDataSource;

  SignUpRepositoryImpl({@required this.signUpDataSource});

  @override
  Future<Either<Failure, SignupByCodeResponse>> signUpByCode(
      {String email, String code}) async {
    try {
      final result =
          await signUpDataSource.signUpByCode(email: email, code: code);
      return Right(result);
    } on DioError catch (e) {
      if (e.response.statusCode == 400) {
        return Left(Failure("Your code is either expired or invalid"));
      }
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
