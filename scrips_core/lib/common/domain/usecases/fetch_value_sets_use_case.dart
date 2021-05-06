import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';

class FetchValueSetsUseCase
    extends UseCase<List<ValueSetData>, FetchValueSetsParams> {
  CommonRepository repository;

  FetchValueSetsUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<ValueSetData>>> call(
      FetchValueSetsParams params) {
    return repository.valueSetsData(params.request);
  }
}

class FetchValueSetsParams extends Equatable {
  final Map<String, String> request;

  FetchValueSetsParams({
    @required this.request,
  }) : super();

  @override
  List<Object> get props => [request];
}
