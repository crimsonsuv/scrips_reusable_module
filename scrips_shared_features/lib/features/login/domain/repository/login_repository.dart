import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> getLoginResponse(
      BuildContext context, String email, String password);
}
