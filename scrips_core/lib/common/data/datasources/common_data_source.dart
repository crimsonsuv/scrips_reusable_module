import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';

abstract class CommonDataSource {
  Future<Locations> fetchLocationsByQuery({String query, String type});
  Future<TwilioResponse> verifyPhone({String phone, String country});
}
