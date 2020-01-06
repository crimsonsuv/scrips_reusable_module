import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/login/data/datasource/login_data_source.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({@required this.loginDataSource});

  @override
  Future<Either<ErrorClass, LoginResponse>> getLoginResponse(
      BuildContext context, String email, String password) async {
    final result = await loginDataSource.login(context,
        userName: email, password: password);

    try {
      return Right(result);
    } on CacheError {
      return Left(CacheError());
    }
  }
}
