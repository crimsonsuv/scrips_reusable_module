import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchLanguageValueSetUseCase
    extends UseCase<List<LanguageValueSetList>, QueryParams> {
  CommonRepository repository;

  FetchLanguageValueSetUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<LanguageValueSetList>>> call(QueryParams params) {
    return repository.languageValueSetList(params.query);
  }
}
