import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/questionnaire_rules_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchQuestionnaireRuleUseCase
    extends UseCase<List<QuestionnaireRules>, NoParams> {
  CommonRepository repository;

  FetchQuestionnaireRuleUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<QuestionnaireRules>>> call(NoParams params) {
    return repository.questionnaireRule();
  }
}
