import 'package:dio/dio.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';

Failure handleFailure(DioError e) {
  int responseCode = e.response.statusCode;
  if (isBetween(responseCode, 400, 499)) {
    return Failure("Request fields are missing.");
  } else if (isBetween(responseCode, 500, 599)) {
    return Failure(
        "Something bad happend in Server, please contact scrips support.");
  } else {
    return Failure(e?.message ?? "");
  }
}
