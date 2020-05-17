import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';

class DummyCommonDataSourceImpl extends CommonDataSource {
  @override
  Future<Locations> fetchLocationsByQuery({String query, String type}) {
    // TODO: implement fetchLocationsByQuery
    throw UnimplementedError();
  }

  @override
  Future<TwilioResponse> verifyPhone({String phone, String country}) {
    // TODO: implement verifyPhone
    throw UnimplementedError();
  }

  @override
  Future<List<ValueSetData>> valueSetsData(Map<String, String> request) {
    // TODO: implement valueSetsData
    throw UnimplementedError();
  }
}
