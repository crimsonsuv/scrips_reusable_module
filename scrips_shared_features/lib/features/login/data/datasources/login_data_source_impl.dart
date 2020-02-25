import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:dio/dio.dart';

class LoginDataSourceImpl extends LoginDataSource {
  static final endPoint =
      'https://scripsidentityapi20191030115107.azurewebsites.net';
  static final dummyEndpoint = 'lib/core/mock_jsons/';
  int timeout = 20;
  Dio client = Dio();

  @override
  Future<LoginTokens> oauth2Login() async {
    final url = Uri.https('scripsidentityapi20191030115107.azurewebsites.net',
        '/connect/authorize', {
      'response_type': 'code',
      'grant_type': 'authorization_code',
      'client_id': 'Scrips.Consumer',
      'redirect_uri': 'http://localhost:8080/',
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
    return loginTokensFromJson(utf8.decode(response.data));
  }

  @override
  Future<UserData> login(BuildContext context,
      {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 2));
    var response;
    if (userName == "admin@scrips.com") {
      response =
          await rootBundle.loadString(dummyEndpoint + "admin_login_data.json");
    } else {
      response =
          await rootBundle.loadString(dummyEndpoint + "user_login_data.json");
      print(response);
    }

    if (response != null) {
      return userDataFromJson(response);
    } else {
      return null;
    }
  }
}
