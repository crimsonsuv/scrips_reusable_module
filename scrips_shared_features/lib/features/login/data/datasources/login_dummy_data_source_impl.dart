import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/src/response.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/forgot_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_by_code_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/post.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/reset_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/set_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDummyDataSourceImpl extends LoginDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 2));
    var response;
    if (userName == "admin@scrips.com") {
      response =
      await rootBundle.loadString(endpoint + "admin_login_data.json");
    } else {
      response = await rootBundle.loadString(endpoint + "user_login_data.json");
      print(response);
    }

    if (response != null) {
      return loginResponseFromJson(response);
    } else {
      return null;
    }
  }

  @override
  Future<Response> forgotPassword(ForgotPasswordModel forgotPasswordModel) {
    // TODO: implement forgotPassword
    return null;
  }

  @override
  Future<Response> loginByCode(LoginByCode loginByCode) {
    // TODO: implement loginByCode
    return null;
  }

  @override
  Future<Response> register(RegisterModel registerModel) {
    // TODO: implement register
    return null;
  }

  @override
  Future<Response> resetPassword(ResetPasswordModel resetPasswordModel) {
    // TODO: implement resetPassword
    return null;
  }

  @override
  Future<Response> setPassword(SetPasswordModel setPasswordModel) {
    // TODO: implement setPassword
    return null;
  }

  @override
  Future<Response> loginToIdentityServer() {
    // TODO: implement loginToIdentityServer
    return null;
  }
}
