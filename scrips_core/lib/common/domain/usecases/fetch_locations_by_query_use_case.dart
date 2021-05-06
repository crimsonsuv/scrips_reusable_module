import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';

class FetchLocationsByQueryUseCase
    extends UseCase<Locations, FetchLocationsByQueryParams> {
  CommonRepository repository;

  FetchLocationsByQueryUseCase({@required this.repository});

  @override
  Future<Either<Failure, Locations>> call(FetchLocationsByQueryParams params) {
    return repository.fetchLocationsByQuery(
        query: params.query, type: params.type);
  }
}

class FetchLocationsByQueryParams extends Equatable {
  final String query;
  final String type;

  FetchLocationsByQueryParams({
    @required this.query,
    @required this.type,
  }) : super();

  @override
  List<Object> get props => [query, type];
}
