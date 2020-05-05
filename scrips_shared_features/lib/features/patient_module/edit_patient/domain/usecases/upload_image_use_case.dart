import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class UploadImageUseCase extends UseCase<String, UploadImageParams> {
  PatientRepository repository;

  UploadImageUseCase({@required this.repository});

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return repository.uploadImage(path: params.path);
  }
}

class UploadImageParams extends Equatable {
  final String path;

  UploadImageParams({@required this.path}) : super([path]);
}
