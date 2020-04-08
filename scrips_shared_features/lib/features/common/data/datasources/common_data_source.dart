import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/license_authority_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_list_model.dart';

abstract class CommonDataSource {
  Future<List<LicenseAuthority>> fetchLicenseAuthorityList();
  Future<List<Speciality>> fetchSpecialityList();
  Future<Status> registerProvider({RegisterModel registerModel});
  Future<List<Gender>> fetchGenderList();
  Future<List<IdType>> idTypeList();
  Future<List<Language>> languageList();
  Future<List<MaritalStatus>> maritialList();
  Future<List<Relationship>> relationshipList();
  Future<List<Ownership>> ownershipList();
  Future<List<Insurance>> insuranceList();
}
