import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/refresh_token_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_preference_util.dart';

enum AppEnvironmentType { production, staging, development }

typedef ApiClientCallback = void Function(int value);

Future<String> getIP() async {
  try {
    Uri url = Uri.parse('https://ipinfo.io/ip');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  } catch (exception) {
    return null;
  }
}

class ScripsLogInterceptor extends LogInterceptor {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');

  ScripsLogInterceptor({
    request,
    requestHeader,
    requestBody,
    responseHeader,
    responseBody,
    error,
    logPrint = print,
  }) : super(
            request: request,
            requestHeader: requestHeader,
            requestBody: requestBody,
            responseHeader: responseHeader,
            responseBody: responseBody,
            error: error,
            logPrint: logPrint);

  @override
  Future onResponse(Response response) async {
    super.onResponse(response);
    if(!kReleaseMode) {
      var r = encoder.convert(response.data);
      if (response.data != null) debugLog(r);
    }
    return;
  }
}

/// This is the singleton API client class which handlers all cloud  transactions
/// All the task raw queries is handle here and return a Future<T> with result
class DioApiClient {
  static const String AUTHORIZATION = 'authorization';
  static const String TOKEN_TYPE = 'token_type';
  static const int timeout = 30000;

  bool didInit = false;

  Dio _authenticatedJsonApiDio;
  Dio _authenticatedBytesApiDio;
  Dio _authenticatedNoHeaderBytesApiDio;
  Dio _unAuthenticatedApiDio;
  Dio _authenticatedBytesMultipartApiDio;

  String _authenticApiBaseUrl = baseUrl;
  String _apiBaseUrl = baseUrl;

  String token;
  RefreshTokenUseCase tokenUseCase;
  LoginUserData loggedUserData;
  String ipAddress;

  /// used to notify listener where login is required when refresh token is expired
  ApiClientCallback listener;

  Dio getUnauthenticApiClient() {
    return _unAuthenticatedApiDio;
  }

  Dio getAuthenticatedJsonApiClient() {
    return _authenticatedJsonApiDio;
  }

  Dio getAuthenticatedBytesApiClient() {
    return _authenticatedBytesApiDio;
  }

  Dio getAuthenticatedBytesMultipartApiClient() {
    return _authenticatedBytesMultipartApiDio;
  }

  Dio getAuthenticatedNoHeaderBytesApiClient() {
    return _authenticatedNoHeaderBytesApiDio;
  }

  DioApiClient(
      {AppEnvironmentType environmentType = AppEnvironmentType.production}) {
//    if (environmentType == ApiEnvironmentType.STAGING) {
//      // Setting Staging BaseUrl
//      this._authenticApiBaseUrl = patientsServer;
//      this._apiBaseUrl = RestConstant.STAGING_STATIC_API_BASE_URL;
//    } else {
//      // Setting Production BaseUrl
//      this._authenticApiBaseUrl = RestConstant.PROD_LIVE_API_BASE_URL;
//      this._apiBaseUrl = RestConstant.PROD_STATIC_API_BASE_URL;
//    }

  // In order to comment logs of response body go to [ScripsLogInterceptor] and comment there
    var scripsLogger = ScripsLogInterceptor(
      request: false,
      requestBody: false,
      responseBody: false,
      requestHeader: false,
      responseHeader: false,
      error: true
    );

    var logger = LogInterceptor(
      request: false,
      requestBody: false,
      responseBody: false,
      requestHeader: false,
      responseHeader: false,
    );

    //--------------------------------------------

    var tokenInterceptor =
        InterceptorsWrapper(onRequest: (RequestOptions options) async {
      token = await accessToken();
      String userDataStr =
          AppPreferenceUtil().readString(currentAppType == AppType.PM
              ? scripsLoggedPMUser
              : (currentAppType == AppType.PA)
                  ? scripsLoggedPAUser
                  : scripsLoggedUAUser);
      if (ipAddress == null) {
        ipAddress = await getIP();
      }
      String timezone = AppPreferenceUtil().readString(currentTimezone);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        loggedUserData = loginUserDataFromJson(userDataStr);
        options.headers['OrganizationId'] = loggedUserData.organizationId;
        options.headers['AppType'] = (currentAppType == AppType.PM)
            ? "Practice Management"
            : ((currentAppType == AppType.PA) ? "Provider" : "User");
        options.headers['IpAddress'] = ipAddress;
        options.headers['UserId'] = loggedUserData.userId;
        options.headers['PracticeId'] = (loggedUserData.role == orgAdminRole ||
                loggedUserData.role == scripsAdminRole)
            ? "00000000-0000-0000-0000-000000000000"
            : loggedUserData.practiceId;
        options.headers['RoleId'] = loggedUserData.role;
        options.headers['userTimeZone'] = timezone;
      }
    });

    var timeoutInterceptor =
        InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var pref = await SharedPreferences.getInstance();
      String lastDate = pref.getString(lastLoginTimeKey);
      DateTime lastLogged;
      if (lastDate == null) {
        lastLogged = DateTime.now();
      } else {
        lastLogged = DateTime.tryParse(lastDate);
      }
      if (DateTime.now().difference(lastLogged).inHours > 2) {
        if (listener != null) listener(400);
      } else {
        pref.setString(lastLoginTimeKey, DateTime.now().toIso8601String());
      }
    });

    _unAuthenticatedApiDio = Dio(BaseOptions(
        baseUrl: _authenticApiBaseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        responseType: ResponseType.bytes));

    _unAuthenticatedApiDio.interceptors.add(logger);

    var options = BaseOptions(
        baseUrl: _apiBaseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.json);
    _authenticatedJsonApiDio = Dio(options);
    _authenticatedJsonApiDio.interceptors.add(timeoutInterceptor);
    _authenticatedJsonApiDio.interceptors.add(tokenInterceptor);
    _authenticatedJsonApiDio.interceptors.add(scripsLogger);
    _authenticatedJsonApiDio.interceptors
        .add(getAuthorisationHandler(_authenticatedJsonApiDio));

    var options2 = BaseOptions(
        baseUrl: _apiBaseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.bytes);

    _authenticatedBytesApiDio = Dio(options2);
    _authenticatedBytesApiDio.interceptors.add(timeoutInterceptor);
    _authenticatedBytesApiDio.interceptors.add(tokenInterceptor);
    _authenticatedBytesApiDio.interceptors.add(logger);
    _authenticatedBytesApiDio.interceptors
        .add(getAuthorisationHandler(_authenticatedBytesApiDio));

    var options3 = BaseOptions(
        baseUrl: _apiBaseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {},
        responseType: ResponseType.bytes);

    _authenticatedNoHeaderBytesApiDio = Dio(options3);
    _authenticatedNoHeaderBytesApiDio.interceptors.add(timeoutInterceptor);
    _authenticatedNoHeaderBytesApiDio.interceptors.add(tokenInterceptor);
    _authenticatedNoHeaderBytesApiDio.interceptors.add(logger);
    _authenticatedNoHeaderBytesApiDio.interceptors
        .add(getAuthorisationHandler(_authenticatedBytesApiDio));

    var options4 = BaseOptions(
        baseUrl: _apiBaseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {},
        responseType: ResponseType.bytes);

    _authenticatedBytesMultipartApiDio = Dio(options4);
    _authenticatedBytesMultipartApiDio.interceptors.add(timeoutInterceptor);
    _authenticatedBytesMultipartApiDio.interceptors.add(tokenInterceptor);
    _authenticatedBytesMultipartApiDio.interceptors.add(logger);
    _authenticatedBytesMultipartApiDio.interceptors
        .add(getAuthorisationHandler(_authenticatedBytesApiDio));
  }

  void setDioForTesting(Dio dio) {
    _authenticatedJsonApiDio = dio;
  }

  InterceptorsWrapper getAuthorisationHandler(Dio client) {
    return InterceptorsWrapper(onError: (DioError error) async {
      tokenUseCase = RefreshTokenUseCase(loginRepository: sl());
      if (error?.response?.statusCode == 401) {
        RequestOptions options = error.response.request;
        client.lock();
        client.interceptors.requestLock.lock();
        //
        final result = await tokenUseCase(NoParams());
        result.fold((error) {
          client.interceptors.requestLock.unlock();
          client.unlock();
          if (listener != null) listener(400);
        }, (success) async {
          client.interceptors.requestLock.unlock();
          client.unlock();
          return await _authenticatedJsonApiDio.request(options.path,
              options: options);
        });
      }
      return error;
    });
  }
}
