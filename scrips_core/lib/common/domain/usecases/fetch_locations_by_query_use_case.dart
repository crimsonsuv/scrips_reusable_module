import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/error/errors.dart';
import 'package:scrips_core/usecase/usecase.dart';

class FetchLocationsByQueryUseCase extends UseCase<Locations, FetchLocationsByQueryParams> {
  CommonRepository repository;

  FetchLocationsByQueryUseCase({@required this.repository});

  @override
  Future<Either<ErrorClass, Locations>> call(FetchLocationsByQueryParams params) {
    return repository.fetchLocationsByQuery(query: params.query);
  }
}

class FetchLocationsByQueryParams extends Equatable {
  final String query;

  FetchLocationsByQueryParams({
    @required this.query,
  }) : super([query]);
}
