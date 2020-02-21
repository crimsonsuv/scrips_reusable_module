import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({@required this.loginDataSource});

  @override
  Future<Either<Failure, LoginResponse>> getLoginResponse(
      BuildContext context, String email, String password) async {
    try {
      final result = await loginDataSource.login(context,
          userName: email, password: password);

      return Right(result);
    } on ServerError {
      return Left(Failure(""));
    }
  }
}
