import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/constants/status_objects.dart';

class CommonDataSourceImpl extends CommonDataSource {
  int defaultTimeout = 10;
  static final googleAPIKey = 'AIzaSyBCrQ1GzILNdnaeDRUZbKzGc1CIICTIAXw';

  static final endpointPlaces = 'https://maps.googleapis.com/maps/api/place/autocomplete';
  Dio client = Dio();

  @override
  Future<Locations> fetchLocationsByQuery({String query}) async{
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': "*",
      'Access-Control-Allow-Methods': "GET"
    };
    client.options.baseUrl = endpointPlaces;
    client.options.queryParameters = {
      "input":"$query",
    "types":"establishment",
      "language":"en",
      "key":"$googleAPIKey"
    };
    var response = await client
        .get('/json',)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching locations Failed');
    });
    print(utf8.decode(response.data));
    return locationsFromJson(utf8.decode(response.data));
  }
}
