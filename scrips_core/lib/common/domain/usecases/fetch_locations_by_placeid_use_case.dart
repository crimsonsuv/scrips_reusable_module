import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/data/datamodels/location_by_placeid_model.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';

class FetchLocationsByPlaceIdUseCase
    extends UseCase<LocationByPlaceId, FetchLocationsByPlaceIdParams> {
  CommonRepository repository;

  FetchLocationsByPlaceIdUseCase({@required this.repository});

  @override
  Future<Either<Failure, LocationByPlaceId>> call(
      FetchLocationsByPlaceIdParams params) {
    return repository.fetchLocationByPlaceId(placeId: params.placeId);
  }
}

class FetchLocationsByPlaceIdParams extends Equatable {
  final String placeId;

  FetchLocationsByPlaceIdParams({
    @required this.placeId,
  }) : super();

  @override
  List<Object> get props => [placeId];
}
