import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchLanguageUseCase extends UseCase<List<Language>, NoParams> {
  CommonRepository repository;

  FetchLanguageUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<Language>>> call(NoParams params) {
    return repository.languageList();
  }
}
