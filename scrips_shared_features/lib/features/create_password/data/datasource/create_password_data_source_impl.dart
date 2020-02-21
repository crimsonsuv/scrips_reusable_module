import 'dart:convert';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/create_password_request_model.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';
import 'package:dio/dio.dart';

class CreatePasswordDataSourceImpl extends CreatePasswordDataSource {
  static final endPoint =
      'https://scripsidentityapi20191030115107.azurewebsites.net';
  int timeout = 20;
  Dio client = Dio();

  @override
  Future<Success> setPassword(
      {String email, String password, String passwordResetToken}) async {
    CreatePasswordRequest data = CreatePasswordRequest(
        email: email,
        password: password,
        confirmPassword: password,
        passwordResetToken: passwordResetToken);
    var body = json.encode(data.toJson()).replaceAll("\\", "");
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {'content-type': 'application/json'};
    var _ = await client
        .post('$endPoint/Account/SetPassword', data: body)
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to create password');
    });
    return Success('');
  }
}
