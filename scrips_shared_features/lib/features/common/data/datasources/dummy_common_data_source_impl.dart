import 'package:flutter/services.dart';
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
import 'package:scrips_shared_features/features/common/data/datasources/common_data_source.dart';

class DummyCommonDataSourceImpl extends CommonDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<List<LicenseAuthority>> fetchLicenseAuthorityList() async {
    var response =
        await rootBundle.loadString(endpoint + "license_authority_list.json");
    if (response != null) {
      return licenseAuthorityFromJson(response);
    } else {
      return null;
    }
  }

  @override
  Future<List<Speciality>> fetchSpecialityList() async {
    var response =
        await rootBundle.loadString(endpoint + "specialities_list.json");
    if (response != null) {
      return specialityFromJson(response);
    } else {
      return null;
    }
  }

  @override
  Future<Status> registerProvider({RegisterModel registerModel}) {
    // TODO: implement registerProvider
    return null;
  }

  @override
  Future<List<Gender>> fetchGenderList() {
    // TODO: implement fetchGenderList
    throw UnimplementedError();
  }

  @override
  Future<List<IdType>> idTypeList() {
    // TODO: implement idTypeList
    throw UnimplementedError();
  }

  @override
  Future<List<Language>> languageList() {
    // TODO: implement languageList
    throw UnimplementedError();
  }

  @override
  Future<List<MaritalStatus>> maritialList() {
    // TODO: implement maritialList
    throw UnimplementedError();
  }

  @override
  Future<List<Relationship>> relationshipList() {
    // TODO: implement relationshipList
    throw UnimplementedError();
  }

  @override
  Future<List<Ownership>> ownershipList() {
    // TODO: implement ownershipList
    throw UnimplementedError();
  }

  @override
  Future<List<Insurance>> insuranceList() {
    // TODO: implement insuranceList
    throw UnimplementedError();
  }

  @override
  Future<List<QuestionnaireRules>> questionnaireRulesList() {
    // TODO: implement questionnaireRulesList
    throw UnimplementedError();
  }

  @override
  Future<List<MedicalSchools>> medicalSchoolList() {
    // TODO: implement MedicalSchoolList
    throw UnimplementedError();
  }

  @override
  Future<List<CodeList>> procedureCodeList(String query) {
    // TODO: implement ProcedureCodeList
    throw UnimplementedError();
  }

  @override
  Future<List<DegreeValueSet>> degreeList() {
    // TODO: implement degreeList
    throw UnimplementedError();
  }

  @override
  Future<List<LanguageValueSetList>> languageValueSetList() {
    // TODO: implement languageValueSetList
    throw UnimplementedError();
  }

  @override
  Future<List<CodeList>> practiceCodeList(String query) {
    // TODO: implement practiceCodeList
    throw UnimplementedError();
  }
}
