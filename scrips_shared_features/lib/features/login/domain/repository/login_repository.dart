import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginUserData>> oauth2Login();
  Future<Either<Failure, LoginUserData>> getLoginResponse(
      String email, String password);
}
