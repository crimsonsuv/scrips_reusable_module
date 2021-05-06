import 'dart:core';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';

class ApiHelper {
  static Failure processApiError(dynamic e) {
    if (e is DioError) {
      return Failure(dioErrorDescription(e));
    } else if (e is TypeError) {
      return Failure(parsingError);
    } else if (e is NoSuchMethodError) {
      return Failure(parsingError);
    } else if (e is FormatException) {
      return Failure(parsingError);
    } else {
      return Failure(e?.toString());
    }
  }

  static String dioErrorDescription(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      if (error.error == "XMLHttpRequest error.") {
        errorDescription = "Processing failed due to CORS issue.";
      } else if (error.response?.statusCode == 404) {
        errorDescription = "";
      } else if (error.response?.statusCode == 401) {
        errorDescription = "Unauthorized, Login Again";
      } else {
        switch (error.type) {
          case DioErrorType.CANCEL:
            errorDescription = "Request to API server was cancelled";
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            errorDescription = "Connection timeout with API server";
            break;
          case DioErrorType.DEFAULT:
            errorDescription =
                "Connection to server failed due to internet connection";
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            errorDescription = "Receive timeout in connection with API server";
            break;
          case DioErrorType.RESPONSE:
            errorDescription =
                "Received invalid status code: ${error?.response?.statusCode}";
            break;
          case DioErrorType.SEND_TIMEOUT:
            errorDescription = "Send timeout in connection with API server";
            break;
        }
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }
}
