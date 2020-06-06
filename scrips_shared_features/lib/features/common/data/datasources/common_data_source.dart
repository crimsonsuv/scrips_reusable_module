import 'package:scrips_core/constants/status_objects.dart';
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

abstract class CommonDataSource {
  Future<List<LicenseAuthority>> fetchLicenseAuthorityList();
  Future<Status> registerProvider({RegisterModel registerModel});
  Future<List<Gender>> fetchGenderList();
  Future<List<IdType>> idTypeList();
  Future<List<MaritalStatus>> maritalList();
  Future<List<Relationship>> relationshipList();
  Future<List<Ownership>> ownershipList();
  Future<List<Insurance>> insuranceList();
  Future<List<QuestionnaireRules>> questionnaireRulesList();
  Future<List<DegreeValueSet>> degreeList(String query);
  Future<List<LanguageValueSetList>> languageValueSetList(String query);
  Future<List<MedicalSchools>> medicalSchoolList(String query);
  Future<List<CodeList>> procedureCodeList(String query);
  Future<List<CodeList>> practiceCodeList(String query);
  Future<List<HospitalList>> hospitalList(String query);
  Future<List<CodeList>> practiceCodeListById(String id);
  Future<List<AppointmentValueSets>> appointmentValueSets(
      String query, String searchFor);
}
