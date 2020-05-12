import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/license_authority_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/questionnaire_rules_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datasources/common_data_source.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class CommonRepositoryImpl extends CommonRepository {
  CommonDataSource commonDataSource;

  CommonRepositoryImpl({@required this.commonDataSource});

  @override
  Future<Either<Failure, List<LicenseAuthority>>>
      fetchLicenseAuthorityList() async {
    try {
      final result = await commonDataSource.fetchLicenseAuthorityList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<Speciality>>> fetchSpecialityList() async {
    try {
      final result = await commonDataSource.fetchSpecialityList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Success>> registerProvider(
      {RegisterModel registerModel}) async {
    try {
      final result =
          await commonDataSource.registerProvider(registerModel: registerModel);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<Gender>>> fetchGenderList() async {
    try {
      final result = await commonDataSource.fetchGenderList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<IdType>>> idTypeList() async {
    try {
      final result = await commonDataSource.idTypeList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<Language>>> languageList() async {
    try {
      final result = await commonDataSource.languageList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<MaritalStatus>>> maritialList() async {
    try {
      final result = await commonDataSource.maritialList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<Relationship>>> relationshipList() async {
    try {
      final result = await commonDataSource.relationshipList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<Ownership>>> ownershipList() async {
    try {
      final result = await commonDataSource.ownershipList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<Insurance>>> insuranceList() async {
    try {
      final result = await commonDataSource.insuranceList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<QuestionnaireRules>>> questionnaireRule() async {
    try {
      final result = await commonDataSource.questionnaireRulesList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
