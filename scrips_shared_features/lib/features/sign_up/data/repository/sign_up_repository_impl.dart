import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/sign_up/data/datasources/sign_up_data_source.dart';
import 'package:scrips_shared_features/features/sign_up/domain/repository/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  SignUpDataSource signUpDataSource;

  SignUpRepositoryImpl({@required this.signUpDataSource});

  @override
  Future<Either<ErrorClass, User>> getUser() async {
    final result = await signUpDataSource.getUser();

    try {
      return Right(result);
    } on CacheError {
      return Left(CacheError());
    }
  }
}
