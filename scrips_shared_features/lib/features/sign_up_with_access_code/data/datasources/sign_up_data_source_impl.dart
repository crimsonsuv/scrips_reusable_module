import 'dart:convert';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_request_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source.dart';
import 'package:dio/dio.dart';

class SignUpDataSourceImpl extends SignUpDataSource {
  static final endPoint =
      'https://scripsidentityapi20191030115107.azurewebsites.net';
  int timeout = 20;
  Dio client = Dio();

  @override
  Future<SignupByCodeResponse> signUpByCode({String email, String code}) async {
    SignupWithCodeRequest data =
        SignupWithCodeRequest(email: email, code: code);
    var body = json.encode(data.toJson()).replaceAll("\\", "");
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {'content-type': 'application/json'};
    var response = await client
        .post('$endPoint/Account/LoginByCode', data: body)
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to signup');
    });
    return signupByCodeResponseFromJson(utf8.decode(response.data));
  }
}
