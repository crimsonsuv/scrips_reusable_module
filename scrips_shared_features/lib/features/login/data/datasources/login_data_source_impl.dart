import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scrips_shared_features/features/login/data/datamodels/forgot_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_by_code_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/reset_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/set_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password}) async {
    return null;
    // TODO: implement login
  }

  @override
  Future<http.Response> forgotPassword(
      ForgotPasswordModel forgotPasswordModel) async {
    var url =
        'https://scripsidentityapi20191030115107.azurewebsites.net/Account/ForgotPassword';

    //encode Map to JSON
    var body = forgotPasswordModelToJson(forgotPasswordModel);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  @override
  Future<http.Response> loginByCode(LoginByCode loginByCode) async {
    var url =
        'https://scripsidentityapi20191030115107.azurewebsites.net/Account/LoginByCode';

    //encode Map to JSON
    var body = loginByCodeToJson(loginByCode);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  @override
  Future<http.Response> register(RegisterModel registerModel) async {
    var url =
        'https://scripsidentityapi20191030115107.azurewebsites.net/Account/Register';

    //encode Map to JSON
    var body = registerModelToJson(registerModel);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  @override
  Future<http.Response> resetPassword(
      ResetPasswordModel resetPasswordModel) async {
    var url =
        'https://scripsidentityapi20191030115107.azurewebsites.net/Account/ResetPassword';

    //encode Map to JSON
    var body = resetPasswordModelToJson(resetPasswordModel);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  @override
  Future<http.Response> setPassword(SetPasswordModel setPasswordModel) async {
    var url =
        'https://scripsidentityapi20191030115107.azurewebsites.net/Account/SetPassword';

    //encode Map to JSON
    var body = setPasswordModelToJson(setPasswordModel);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  @override
  Future<http.Response> loginToIdentityServer() async {
    var url =
        'https://scripsidentityapi20191030115107.azurewebsites.net/Account/Login/';
    var response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    print("${response.statusCode}");
    print("${response.body}");

    return response;
  }
}
