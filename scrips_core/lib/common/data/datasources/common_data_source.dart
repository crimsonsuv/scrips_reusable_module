import 'package:scrips_core/common/data/datamodels/location_by_placeid_model.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';

abstract class CommonDataSource {
  Future<Locations> fetchLocationsByQuery({String query, String type});
  Future<LocationByPlaceId> fetchLocationByPlaceId({String placeId});
  Future<TwilioResponse> verifyPhone({String phone, String country});
  Future<List<ValueSetData>> valueSetsData(Map<String, String> request);
  Future<List<ValueSetData>> valueSetsDataSimpleKey(
      Map<String, String> request);
}
