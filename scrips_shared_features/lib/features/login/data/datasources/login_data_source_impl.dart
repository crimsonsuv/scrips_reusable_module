import 'dart:async';
import 'dart:convert';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:dio/dio.dart';

class LoginDataSourceImpl extends LoginDataSource {
  static final endPoint =
      'https://scripsidentityapi20191030115107.azurewebsites.net';
  static final dummyEndpoint = 'lib/core/mock_jsons/';
  int timeout = 20;
  Dio client = Dio();

  @override
  Future<LoginUserData> oauth2Login() async {
    final url = Uri.https('scripsidentityapi20191030115107.azurewebsites.net',
        '/connect/authorize', {
      'response_type': 'code',
      'grant_type': 'authorization_code',
      'client_id': 'Scrips.Consumer',
      'redirect_uri': 'com.scrips.pa://',
      'scope': 'openid',
    });
    final result = await FlutterWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme: "com.scrips.pa",
    );
    final code = Uri.parse(result).queryParameters['code'];

    if (code == null || code == "") {
      throw Failure("Login Process Interrupted!");
    }

    client.options.responseType = ResponseType.bytes;
    client.options.headers = {'content-type': 'application/json'};
    var response = await client
        .get(
            '$endPoint/Account/AccessToken?accessCode=$code&redirectUrl=com.scrips.pa://')
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to signup');
    });
    final tokenData =  loginTokensFromJson(utf8.decode(response.data));

    client.options.headers = {'content-type': 'application/json', 'Authorization':'Bearer ${tokenData.accessToken}'};
    var userDataResponse = await client
        .get(
        '$endPoint/GetUserDataToken')
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to signup');
    });

    return loginUserDataFromJson(utf8.decode(userDataResponse.data));
  }

  @override
  Future<LoginUserData> login(
      {String userName, String password}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded'
    };
    Map<String, dynamic> data = {
    "client_id":"Scrips.Consumer",
    "grant_type":"password",
    "username":userName,
    "password":password,
    "client_secret":"secret"
    };
    var response = await client
        .post('$endPoint/connect/token', data: data, options: Options(contentType: "application/x-www-form-urlencoded"))
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to fetch User Details');
    });
    final tokenData =  loginTokensFromJson(utf8.decode(response.data));

    client.options.headers = {'content-type': 'application/json', 'Authorization':'Bearer ${tokenData.accessToken}'};
    var userDataResponse = await client
        .get(
        '$endPoint/GetUserDataToken')
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to signup');
    });

    return loginUserDataFromJson(utf8.decode(userDataResponse.data));
  }
}
