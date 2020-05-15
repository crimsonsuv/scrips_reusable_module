import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/degree_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/license_authority_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/medical_schools_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/procedure_skill_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/questionnaire_rules_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_valueset_list_model.dart';

abstract class CommonRepository {
  Future<Either<Failure, List<LicenseAuthority>>> fetchLicenseAuthorityList();

  Future<Either<Failure, List<Speciality>>> fetchSpecialityList();

  Future<Either<Failure, Success>> registerProvider(
      {RegisterModel registerModel});

  Future<Either<Failure, List<Gender>>> fetchGenderList();
  Future<Either<Failure, List<IdType>>> idTypeList();
  Future<Either<Failure, List<Language>>> languageList();
  Future<Either<Failure, List<MaritalStatus>>> maritialList();
  Future<Either<Failure, List<Relationship>>> relationshipList();
  Future<Either<Failure, List<Ownership>>> ownershipList();
  Future<Either<Failure, List<Insurance>>> insuranceList();
  Future<Either<Failure, List<QuestionnaireRules>>> questionnaireRule();
  Future<Either<Failure, List<DegreeValueSet>>> degreeList();
  Future<Either<Failure, List<LanguageValueSetList>>> languageValueSetList();
  Future<Either<Failure, List<MedicalSchools>>> medicalSchoolList();
  Future<Either<Failure, List<CodeList>>> procedureCodeList(String query);
  Future<Either<Failure, List<CodeList>>> practiceCodeList(String query);
}
