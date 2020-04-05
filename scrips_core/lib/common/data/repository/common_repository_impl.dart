import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scrips_core/common/data/datamodels/country_code_model.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
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
      if (country == null) {
        return Right(result);
      } else {
        var countryCodeList =
            await rootBundle.loadString(endpoint + "country_code_list.json");
        List<CountryCode> codes = countryCodeFromJson(countryCodeList);
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
      }
    } on DioError catch (e) {
      return Left(Failure("Please, provide a valid number"));
    } on Failure {
      return Left(Failure("Timeout.."));
    }
  }
}
