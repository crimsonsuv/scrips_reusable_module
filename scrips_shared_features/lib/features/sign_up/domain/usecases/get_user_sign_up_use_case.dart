import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/sign_up/domain/repository/sign_up_repository.dart';

class GetUserSignUpUseCase extends UseCase<User, NoParams> {
  SignUpRepository signUpRepository;

  GetUserSignUpUseCase({@required this.signUpRepository});

  @override
  Future<Either<ErrorClass, User>> call(NoParams params) async {
    return await signUpRepository.getUser();
  }
}
