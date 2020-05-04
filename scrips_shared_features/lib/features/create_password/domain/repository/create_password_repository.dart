import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';

abstract class CreatePasswordRepository {
  Future<Either<Failure, Success>> setPassword(
      {String email, String password, String passwordResetToken});

  Future<Either<Failure, SignUpUserData>> signupUserData({String email});
}
