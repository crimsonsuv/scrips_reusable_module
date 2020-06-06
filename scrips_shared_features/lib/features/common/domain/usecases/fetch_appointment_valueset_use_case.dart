import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/appointment_value_sets_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class AppointmentValueSetsUseCase
    extends UseCase<List<AppointmentValueSets>, QueryParams> {
  CommonRepository repository;

  AppointmentValueSetsUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<AppointmentValueSets>>> call(QueryParams params) {
    return repository.appointmentValueSetsByQuery(
        params.query, params.searchFor);
  }
}
