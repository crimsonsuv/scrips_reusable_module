import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  String endPoint = identityServer;
  String dummyEndpoint = 'lib/core/mock_jsons/';
  int timeout = 20;
  Dio client = Dio();
  String redirectURL = currentAppType == AppType.PM
      ? 'com.scrips.pm://'
      : (currentAppType == AppType.PA
          ? 'com.scrips.pa://'
          : 'com.scrips.uk://');
  String redirectScheme = currentAppType == AppType.PM
      ? 'com.scrips.pm'
      : (currentAppType == AppType.PA ? 'com.scrips.pa' : 'com.scrips.uk');

  @override
  Future<LoginUserData> oauth2Login() async {
    final url = Uri.https(oath2LoginUrl, '/connect/authorize', {
      'response_type': 'code',
      'grant_type': 'authorization_code',
      'client_id': 'Scrips.Consumer',
      'redirect_uri': redirectURL,
      'scope': 'openid',
      'max_age': "10",
    });
    final result = await FlutterWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme: redirectScheme,
    );
    final code = Uri.parse(result).queryParameters['code'];

    if (code == null || code == "") {
      throw Failure("Login Process Interrupted!");
    }

    client.options.responseType = ResponseType.bytes;
    client.options.headers = {'content-type': 'application/json'};
    var response = await client
        .get(
            '$endPoint/Account/AccessToken?accessCode=$code&redirectUrl=$redirectURL')
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to signup');
    });
    final tokenData = loginTokensFromJson(utf8.decode(response.data));

    client.options.headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${tokenData.accessToken}'
    };
    var userDataResponse = await client
        .get('$endPoint/GetUserDataToken')
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to process request, try again');
    });

    return loginUserDataFromJson(utf8.decode(userDataResponse.data));
  }

  @override
  Future<LoginUserData> login({String userName, String password}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded'
    };
    Map<String, dynamic> data = {
      "client_id": "Scrips.Consumer",
      "grant_type": "password",
      "username": userName,
      "password": password,
      "client_secret": "secret",
      "scope": "openid"
    };
    var response = await client
        .post('$endPoint/connect/token',
            data: data,
            options: Options(contentType: "application/x-www-form-urlencoded"))
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to fetch User Details');
    });
    final tokenData = loginTokensFromJson(utf8.decode(response.data));
    print("Token : ${tokenData.accessToken}");
    client.options.headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${tokenData.accessToken}'
    };
    var userDataResponse = await client
        .get('$endPoint/GetUserDataToken')
        .timeout(Duration(seconds: timeout), onTimeout: () {
      throw Failure('Failed to process request, try again');
    });

    return loginUserDataFromJson(utf8.decode(userDataResponse.data));
  }
}
