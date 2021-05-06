import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scrips_core/common/data/datamodels/country_code_model.dart';
import 'package:scrips_core/common/data/datamodels/location_by_placeid_model.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/constants/status_objects.dart';

class CommonRepositoryImpl extends CommonRepository {
  CommonDataSource commonDataSource;

  CommonRepositoryImpl({@required this.commonDataSource});

  static final endpoint =
      'submodules/scrips_msp1_flutter_shared/scrips_core/lib/mock_data/';

  @override
  Future<Either<Failure, Locations>> fetchLocationsByQuery(
      {String query, String type}) async {
    try {
      final result = await commonDataSource.fetchLocationsByQuery(
          query: query, type: type);
      return Right(result);
    } on DioError {
      return Left(Failure("Failed to get data"));
    } on Failure {
      return Left(Failure("Timeout.."));
    }
  }

  @override
  Future<Either<Failure, TwilioResponse>> verifyPhone(
      {String phone, String country}) async {
    try {
      final result =
          await commonDataSource.verifyPhone(phone: phone, country: country);
      if (country == null || country == "") {
        return Right(result);
      } else {
        var countryCodeList =
            await rootBundle.loadString(endpoint + "country_code_list.json");
        List<CountryCode> codes = countryCodeFromJson(countryCodeList);
        if(codes
            .where((data) => data.name == country).length > 0){
          String countryCode = codes
              .where((data) => data.name == country)
              ?.toList()
              ?.elementAt(0)
              ?.code ??
              "";
          if (countryCode == result.countryCode) {
            return Right(result);
          } else {
            return Left(Failure("Number outside $country not allowed"));
          }
        } else {
          return Left(Failure("Number outside $country not allowed"));
        }

      }
    } on DioError catch (_) {
      return Left(Failure("Please, provide a valid number"));
    } on Failure {
      return Left(Failure("Timeout.."));
    }
  }

  @override
  Future<Either<Failure, List<ValueSetData>>> valueSetsData(
      Map<String, String> request) async {
    try {
      final result = await commonDataSource.valueSetsData(request);
      return Right(result);
    } on DioError catch (_) {
      return (Left(Failure("Fetching Data Failed")));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<ValueSetData>>> valueSetsDataSimpleKey(
      Map<String, String> request) async {
    try {
      final result = await commonDataSource.valueSetsDataSimpleKey(request);
      return Right(result);
    } on DioError catch (_) {
      return (Left(Failure("Fetching Data Failed")));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, LocationByPlaceId>> fetchLocationByPlaceId(
      {String placeId}) async {
    try {
      final result =
          await commonDataSource.fetchLocationByPlaceId(placeId: placeId);
      return Right(result);
    } on DioError catch (_) {
      return (Left(Failure("Fetching Data Failed")));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
