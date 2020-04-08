import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignupByCodeResponse>> signUpByCode(
      {String email, String code});
}
