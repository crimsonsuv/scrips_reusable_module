import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
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
import 'package:scrips_shared_features/features/common/data/datamodels/procedure_skill_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/questionnaire_rules_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datasources/common_data_source.dart';

class CommonDataSourceImpl extends CommonDataSource {
  int defaultTimeout = 120;
  static final endpoint = 'http://75.126.168.31:7084/api/Master';
  static final endpointRegister = identityServer;
  static final endpointPractice = practiceServer;
  static final endpointAppointment = appointmentServer;
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
    try {
      var result = licenseAuthorityFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = Success('Provider Successfully Registered');
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = genderFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = idTypeFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<MaritalStatus>> maritalList() async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/MaritalStatus',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching Maritial Status List Failed');
    });
    try {
      var result = maritalStatusFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = relationshipFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = ownershipFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = insuranceFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = questionnaireRulesFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<MedicalSchools>> medicalSchoolList(String query) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/MedicalSchools?searchQuery=$query',
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
      '$endpoint/ProcedureCodesList?searchQuery=$query',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () async {
      throw Failure('Fetching Procedure Code List Failed');
    });
    try {
      var result = procedureCodesListFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<DegreeValueSet>> degreeList(String query) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/DegreeValueSet?searchQuery=$query',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () async {
      throw Failure('Fetching Degree List Failed');
    });
    try {
      var result = degreeValueSetFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<LanguageValueSetList>> languageValueSetList(String query) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/LanguageValueSetList?searchQuery=$query',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching language valueset List Failed');
    });
    try {
      var result = languageValueSetListFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
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
    try {
      var result = practiceCodeListFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<HospitalList>> hospitalList(String query) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/Hospital?searchQuery=$query',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching speciality valueset List Failed');
    });
    try {
      var result = hospitalListFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<CodeList>> practiceCodeListById(String id) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$endpoint/GetPracticeCodeListById/$id',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching speciality valueset List Failed');
    });
    try {
      var result = practiceCodeListFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }

  @override
  Future<List<AppointmentValueSets>> appointmentValueSets(
      String query, String searchFor) async {
    client.options.responseType = ResponseType.bytes;
    var response = await client
        .get(
      '$appointmentServer/api/Appointment/:SearchValueSets?SearchText=$query&SearchFor=$searchFor',
    )
        .timeout(Duration(seconds: defaultTimeout), onTimeout: () {
      throw Failure('Fetching appointment valueset List Failed');
    });
    try {
      var result = appointmentValueSetsFromJson(utf8.decode(response.data));
      return result;
    } on TypeError {
      throw Failure(parsingError);
    } on NoSuchMethodError {
      throw Failure(parsingError);
    }
  }
}
