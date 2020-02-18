import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/common/data/datamodels/location_request_model.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/constants/status_objects.dart';

class CommonDataSourceImpl extends CommonDataSource {
  int defaultTimeout = 10;
  static final googleAPIKey = 'AIzaSyBCrQ1GzILNdnaeDRUZbKzGc1CIICTIAXw';

  static final endpointPlaces = 'http://52.25.96.244:7008';
  Dio client = Dio();

  @override
  Future<Locations> fetchLocationsByQuery({String query}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json',
    };

    LocationRequest requestData = LocationRequest(
        input: query,
        types: "establishment",
        language: "en",
        key: googleAPIKey);
    var jsonRequest = requestData.toJson();
    var body = jsonEncode(jsonRequest);
    var response = await client
        .put('$endpointPlaces/Practice/GetAddress', data: body)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching locations Failed');
    });
    print(utf8.decode(response.data));
    return locationsFromJson(utf8.decode(response.data));
  }
}