import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/error/errors.dart';
import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';

class CommonRepositoryImpl extends CommonRepository {
  CommonDataSource commonDataSource;

  CommonRepositoryImpl({@required this.commonDataSource});

  @override
  Future<Either<ErrorClass, Locations>> fetchLocationsByQuery({String query}) async{
    try {
      final result =
          await commonDataSource.fetchLocationsByQuery(query: query);
      return Right(result);
    } on DioError {
      return Left(ServerError());
    } on Failure {
      return Left(ServerError());
    }
  }
}