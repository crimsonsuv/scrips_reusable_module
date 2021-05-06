import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/common/data/datamodels/location_by_placeid_model.dart';
import 'package:scrips_core/common/data/datamodels/location_request_model.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/dio_api_client.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';

class CommonDataSourceImpl extends CommonDataSource {
  int defaultTimeout = 10;
  static final googleAPIKey = 'AIzaSyBCrQ1GzILNdnaeDRUZbKzGc1CIICTIAXw';
  static final endpointTwilio = 'https://lookups.twilio.com';
  Dio client;

  CommonDataSourceImpl(){
    client = sl<DioApiClient>().getAuthenticatedBytesApiClient();
  }

  @override
  Future<Locations> fetchLocationsByQuery({String query, String type}) async {

    LocationRequest requestData = LocationRequest(
        input: query, types: "$type", language: "en", key: googleAPIKey);
    var jsonRequest = requestData.toJson();
    var body = jsonEncode(jsonRequest);
    var response = await client
        .put('${masterAPI(MasterService.Master)}/GetAddress', data: body)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching locations Failed');
    });
    print(utf8.decode(response.data));
    return locationsFromJson(utf8.decode(response.data));
  }

  @override
  Future<TwilioResponse> verifyPhone({String phone, String country}) async {
    //TODO: check this hard coded token
    Dio client = Dio();
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic QUMwMjFiNmU2YWU2ZTA4NTk2NThlMmVkY2Q4Y2MzZTBiYzo5YTY2NjAzYzAyMzZkYTFmMmZhNjQ1MjY1MmI3YzgwYg==',
    };
    var response = await client
        .get('$endpointTwilio/v1/PhoneNumbers/$phone')
        .timeout(Duration(seconds: defaultTimeout + 10), onTimeout: () {
      throw Failure('Fetching locations Failed');
    });
    print(utf8.decode(response.data));
    return twilioResponseFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<ValueSetData>> valueSetsData(Map<String, String> request) async {
    var jsonData = jsonEncode(request);
    var response = await client
        .get(
      '${masterAPI(MasterService.Master)}/SearchValueSets?request.searchText=${request.values.toList()[0]}&request.searchFor=${request.values.toList()[1]}',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching valuesets Failed');
    });
    return valueSetDataFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<ValueSetData>> valueSetsDataSimpleKey(
      Map<String, String> request) async {
    var jsonData = jsonEncode(request);
    var response = await client
        .get('${masterAPI(MasterService.Master)}/SearchValueSets',
            queryParameters: request)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching valuesets Failed');
    });
    return valueSetDataFromJson(utf8.decode(response.data));
  }

  @override
  Future<LocationByPlaceId> fetchLocationByPlaceId({String placeId}) async {
    var jsonRequest = {"placeid": placeId, "key": googleAPIKey};
    var body = jsonEncode(jsonRequest);
    var response = await client
        .put('${masterAPI(MasterService.Master)}/GetLatlong', data: body)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching locations Failed');
    });
    print(utf8.decode(response.data));
    return locationByPlaceIdFromJson(utf8.decode(response.data));
  }
}
