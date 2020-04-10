import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/features/forgot_password/data/datasource/forgot_password_data_source.dart';

class ForgotPasswordDataSourceImpl extends ForgotPasswordDataSource {
  static final endPoint = identityServer;
  int timeout = 20;
  Dio client = Dio();

  @override
  Future<Success> forgotPassword({String email}) async {
    final data = {"email": (email == null) ? "" : email};
    var body = json.encode(data).replaceAll("\\", "");
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {'content-type': 'application/json'};
    var _ = await client
        .post('$endPoint/Account/ForgotPassword', data: body)
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to send Reset code');
    });
    return Success('');
  }
}
