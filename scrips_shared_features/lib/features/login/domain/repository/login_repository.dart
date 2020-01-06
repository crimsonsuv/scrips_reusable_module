import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_shared_features/core/error/errors.dart';

abstract class LoginRepository {
  Future<Either<ErrorClass, LoginResponse>> getLoginResponse(
      BuildContext context, String email, String password);
}
