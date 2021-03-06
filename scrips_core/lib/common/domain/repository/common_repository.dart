import 'package:dartz/dartz.dart';
import 'package:scrips_core/common/data/datamodels/location_by_placeid_model.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';
import 'package:scrips_core/constants/status_objects.dart';

abstract class CommonRepository {
  Future<Either<Failure, Locations>> fetchLocationsByQuery(
      {String query, String type});
  Future<Either<Failure, LocationByPlaceId>> fetchLocationByPlaceId(
      {String placeId});
  Future<Either<Failure, TwilioResponse>> verifyPhone(
      {String phone, String country});
  Future<Either<Failure, List<ValueSetData>>> valueSetsData(
      Map<String, String> request);
  Future<Either<Failure, List<ValueSetData>>> valueSetsDataSimpleKey(
      Map<String, String> request);
}
