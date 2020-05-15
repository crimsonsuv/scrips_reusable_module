import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
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

class CommonDataSourceImpl extends CommonDataSource {
  int defaultTimeout = 120;
  static final endpoint = 'http://75.126.168.31:7084/api/Master';
  static final endpointRegister =
      'https://scripsidentityapi20191030115107.azurewebsites.net';
  static final endpointPractice = practiceServer;
  Dio client = Dio();

  @override
  Future<List<LicenseAuthority>> fetchLicenseAuthorityList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/LicenseAuthority',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching License Authority List Failed');
    });
    return licenseAuthorityFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<Speciality>> fetchSpecialityList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/Specialities',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Specialities List Failed');
    });
    return specialityFromJson(utf8.decode(response.data));
  }

  @override
  Future<Status> registerProvider({RegisterModel registerModel}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    var data = registerModel.toJson();
    var body = json.encode(data);

    var _ = await client
        .post('$endpointRegister/Account/Register', data: body)
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Register Provider Failed');
    });
    return Success('Provider Successfully Registered');
  }

  @override
  Future<List<Gender>> fetchGenderList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/Gender',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Gender List Failed');
    });
    return genderFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<IdType>> idTypeList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/IdentityType',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching ID Type List Failed');
    });
    return idTypeFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<Language>> languageList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/Languages',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Language List Failed');
    });
    return languageFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<MaritalStatus>> maritialList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/MaritalStatus',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Maritial Status List Failed');
    });
    return maritalStatusFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<Relationship>> relationshipList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/Relation',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Relationship List Failed');
    });
    return relationshipFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<Ownership>> ownershipList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/OwnerType',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Ownership List Failed');
    });
    return ownershipFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<Insurance>> insuranceList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/Insurar',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Insurance List Failed');
    });
    return insuranceFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<QuestionnaireRules>> questionnaireRulesList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpointPractice/api/Questionnaires/Rules',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Insurance List Failed');
    });
    return questionnaireRulesFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<MedicalSchools>> medicalSchoolList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/MedicalSchools',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Medical schools List Failed');
    });
    return medicalSchoolsFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<CodeList>> procedureCodeList(String query) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/PracticeCodeList?searchQuery=$query',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () async {
      throw Failure('Fetching Procedure Code List Failed');
    });
    return procedureCodesListFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<DegreeValueSet>> degreeList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/DegreeValueSet',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () async {
      throw Failure('Fetching Degree List Failed');
    });
    return degreeValueSetFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<LanguageValueSetList>> languageValueSetList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/LanguageValueSetList',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching language valueset List Failed');
    });
    return languageValueSetListFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<CodeList>> practiceCodeList(String query) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/PracticeCodeList?searchQuery=$query',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching speciality valueset List Failed');
    });
    return practiceCodeListFromJson(utf8.decode(response.data));
  }
}
