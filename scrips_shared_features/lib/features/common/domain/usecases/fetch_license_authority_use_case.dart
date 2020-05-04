import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/license_authority_list_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchLicencesUseCase extends UseCase<List<LicenseAuthority>, NoParams> {
  CommonRepository repository;

  FetchLicencesUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<LicenseAuthority>>> call(NoParams params) {
    return repository.fetchLicenseAuthorityList();
  }
}
