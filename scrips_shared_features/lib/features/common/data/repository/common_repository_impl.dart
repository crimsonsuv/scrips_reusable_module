import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/appointment_value_sets_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/degree_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/hospital_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/license_authority_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/medical_schools_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/questionnaire_rules_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_valueset_list_model.dart';
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
    } on Failure catch (e) {
      return Left(Failure(e.message));
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
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Gender>>> fetchGenderList() async {
    try {
      final result = await commonDataSource.fetchGenderList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<IdType>>> idTypeList() async {
    try {
      final result = await commonDataSource.idTypeList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MaritalStatus>>> maritalList() async {
    try {
      final result = await commonDataSource.maritalList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Relationship>>> relationshipList() async {
    try {
      final result = await commonDataSource.relationshipList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Ownership>>> ownershipList() async {
    try {
      final result = await commonDataSource.ownershipList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Insurance>>> insuranceList() async {
    try {
      final result = await commonDataSource.insuranceList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<QuestionnaireRules>>> questionnaireRule() async {
    try {
      final result = await commonDataSource.questionnaireRulesList();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<DegreeValueSet>>> degreeList(String query) async {
    try {
      final result = await commonDataSource.degreeList(query);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<LanguageValueSetList>>> languageValueSetList(
      String query) async {
    try {
      final result = await commonDataSource.languageValueSetList(query);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MedicalSchools>>> medicalSchoolList(
      String query) async {
    try {
      final result = await commonDataSource.medicalSchoolList(query);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CodeList>>> procedureCodeList(
      String query) async {
    try {
      final result = await commonDataSource.procedureCodeList(query);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CodeList>>> practiceCodeList(String query) async {
    try {
      final result = await commonDataSource.practiceCodeList(query);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<HospitalList>>> hospitalList(String query) async {
    try {
      final result = await commonDataSource.hospitalList(query);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CodeList>>> practiceCodeListById(
      String id) async {
    try {
      final result = await commonDataSource.practiceCodeListById(id);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentValueSets>>>
      appointmentValueSetsByQuery(String query, String searchFor) async {
    try {
      final result =
          await commonDataSource.appointmentValueSets(query, searchFor);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }
}
