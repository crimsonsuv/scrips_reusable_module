import 'package:get_it/get_it.dart';
import 'package:scrips_shared_features/features/common/data/datasources/common_data_source.dart';
import 'package:scrips_shared_features/features/common/data/datasources/common_data_source_impl.dart';
import 'package:scrips_shared_features/features/common/data/repository/common_repository_impl.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_appointment_valueset_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_degree_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_gender_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_hospital_list_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_idtype_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_insurace_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_language_valueset_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_license_authority_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_marital_status_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_medical_school_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_ownership_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_procedure_code_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_questionnaire_rule_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_relationship_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_speciality_by_id_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_speciality_valueset_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/register_provider_use_case.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source_impl.dart';
import 'package:scrips_shared_features/features/create_password/data/repository/create_password_repository_impl.dart';
import 'package:scrips_shared_features/features/create_password/domain/repository/create_password_repository.dart';
import 'package:scrips_shared_features/features/create_password/domain/usecase/create_password_use_case.dart';
import 'package:scrips_shared_features/features/create_password/domain/usecase/signup_user_data_use_case.dart';
import 'package:scrips_shared_features/features/create_password/presentation/bloc/create_password/create_password_bloc.dart';
import 'package:scrips_shared_features/features/forgot_password/data/datasource/forgot_password_data_source.dart';
import 'package:scrips_shared_features/features/forgot_password/data/datasource/forgot_password_data_source_impl.dart';
import 'package:scrips_shared_features/features/forgot_password/data/repository/forgot_password_repository_impl.dart';
import 'package:scrips_shared_features/features/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:scrips_shared_features/features/forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:scrips_shared_features/features/landing/data/datasources/landing_data_source.dart';
import 'package:scrips_shared_features/features/landing/data/datasources/landing_data_source_impl.dart';
import 'package:scrips_shared_features/features/landing/data/datasources/landing_dummy_data_source_impl.dart';
import 'package:scrips_shared_features/features/landing/data/repository/landing_repository_impl.dart';
import 'package:scrips_shared_features/features/landing/domain/repository/landing_repository.dart';
import 'package:scrips_shared_features/features/landing/domain/usecases/get_logged_user_use_case.dart';
import 'package:scrips_shared_features/features/landing/presentation/bloc/landing/landing_bloc.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source_impl.dart';
import 'package:scrips_shared_features/features/login/data/repository/login_repository_impl.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/get_login_response_use_case.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/oauth_login_use_case.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:scrips_shared_features/features/password_changed_success/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datasources/patient_data_source.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datasources/patient_data_source_impl.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/repository/patient_repository_impl.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/create_contact_details_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/create_patient_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/fetch_emergency_contacts_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/fetch_insurance_list_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/fetch_matching_records_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/fetch_patient_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/save_emergency_contacts_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/save_insurance_list_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/update_patient_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/usecases/upload_image_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datasources/patients_list_data_source.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datasources/patients_list_data_source_impl.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/repository/patients_list_repository_impl.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/repository/patients_list_repository.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/usecases/archive_patiets_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/usecases/fetch_patients_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/reset_password_access_code/presentation/bloc/reset_password_access_code_bloc.dart';
import 'package:scrips_shared_features/features/reset_password_new_password/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source_impl.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/repository/sign_up_repository_impl.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/repository/sign_up_repository.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/usecases/signup_by_code_use_case.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/bloc/bloc.dart';

final sl = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = true;

Future<void> initServiceLocator() async {
  /// Features
  /// Landing
  //bloc
  sl.registerFactory(
      () => LandingBloc(getLoggedUserUseCase: sl(), oAuthLoginUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => GetLoggedUserUseCase(landingRepository: sl()));

  // Data sources
  sl.registerLazySingleton<LandingDataSource>(() => USE_FAKE_IMPLEMENTATION
      ? LandingDummyDataSourceImpl()
      : LandingDataSourceImpl());

  // repository
  sl.registerLazySingleton<LandingRepository>(
      () => LandingRepositoryImpl(landingDataSource: sl()));

  /// Login
  // bloc
  sl.registerFactory(() => LoginBloc(loginResponseUseCase: sl()));
  // use cases
  sl.registerLazySingleton(() => OAuthLoginUseCase(loginRepository: sl()));
  sl.registerLazySingleton(
      () => GetLoginResponseUseCase(loginRepository: sl()));

  // Data sources
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());

  // repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        loginDataSource: sl(),
      ));

  /// Sign Up
  // bloc
  sl.registerFactory(() => SignupWithAccessCodeBloc(
      signupByCodeUseCase: sl(), oAuthLoginUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => SignupByCodeUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<SignUpDataSource>(() => SignUpDataSourceImpl());

  // repository
  sl.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataSource: sl()));

  /// Create Password
  //bloc
  sl.registerFactory(() => CreatePasswordBloc(
      createPasswordUseCase: sl(), signUpUserDataUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => CreatePasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignUpUserDataUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<CreatePasswordDataSource>(
      () => CreatePasswordDataSourceImpl());

  // repository
  sl.registerLazySingleton<CreatePasswordRepository>(
      () => CreatePasswordRepositoryImpl(createPasswordDataSource: sl()));

  /// Forgot Password
  //bloc
  sl.registerFactory(() =>
      ForgotPasswordBloc(forgotPasswordUseCase: sl(), oAuthLoginUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => ForgotPasswordUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<ForgotPasswordDataSource>(
      () => ForgotPasswordDataSourceImpl());

  // repository
  sl.registerLazySingleton<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImpl(forgotPasswordDataSource: sl()));

  /// Reset Password Access code
  //bloc
  sl.registerFactory(() => ResetPasswordAccessCodeBloc(
      forgotPasswordUseCase: sl(),
      signupByCodeUseCase: sl(),
      oAuthLoginUseCase: sl()));

  // use cases

  // Data sources

  // repository

  /// Reset Password New Password
  //bloc
  sl.registerFactory(() => ResetPasswordNewPasswordBloc(
      oAuthLoginUseCase: sl(), createPasswordUseCase: sl()));

  // use cases

  // Data sources

  // repository

  /// Password Changed Success
  //bloc
  sl.registerFactory(() => PasswordChangedSuccessBloc(oAuthLoginUseCase: sl()));

  // use cases

  // Data sources

  // repository

  /// Patient List
  // bloc
  sl.registerFactory(
    () => PatientListBloc(
        fetchPatientsUseCase: sl(), archivePatientsUseCase: sl()),
  );

  // use cases
  sl.registerLazySingleton(() => FetchPatientsUseCase(repository: sl()));
  sl.registerLazySingleton(() => ArchivePatientsUseCase(repository: sl()));

  // data sources
  sl.registerLazySingleton<PatientsListDataSource>(
    () => PatientsListDataSourceImpl(),
  );

  // repository
  sl.registerLazySingleton<PatientsListRepository>(
      () => PatientsListRepositoryImpl(patientsListDataSource: sl()));

  ///Common
  //Use cases
  sl.registerLazySingleton(() => FetchLicencesUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterProviderUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchGenderUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchIdTypeUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchMaritalStatusUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchRelationshipUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchOwnershipUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchInsuranceUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => FetchQuestionnaireRuleUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchDegreeUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => FetchLanguageValueSetUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => FetchMedicalSchoolSetUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchProcedureCodeUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchSpecialityCodeUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchHospitalListUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => FetchSpecialityByIdCodeUseCase(repository: sl()));
  sl.registerLazySingleton(() => AppointmentValueSetsUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<CommonDataSource>(() => CommonDataSourceImpl());

  // Repository
  sl.registerLazySingleton<CommonRepository>(
      () => CommonRepositoryImpl(commonDataSource: sl()));

  /// Create/Edit List
  // bloc
  sl.registerFactory(
    () => CreateEditPatientBloc(
        fetchGenderUseCase: sl(),
        fetchIdTypeUseCase: sl(),
        fetchLanguageUseCase: sl(),
        fetchMaritalStatusUseCase: sl(),
        fetchRelationshipUseCase: sl(),
        fetchPatientUseCase: sl(),
        fetchOwnershipUseCase: sl(),
        fetchInsuranceUseCase: sl(),
        updatePatientUseCase: sl(),
        fetchMatchingPatientUseCase: sl(),
        fetchEmergencyContactsUseCase: sl(),
        fetchInsuranceListUseCase: sl(),
        saveEmergencyContactsUseCase: sl(),
        saveInsuranceListUseCase: sl(),
        createContactDeatilsUseCase: sl(),
        createPatientUseCase: sl(),
        uploadImageUseCase: sl()),
  );

  // use cases
  sl.registerLazySingleton(() => FetchPatientUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdatePatientUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchMatchingPatientUseCase(repository: sl()));

  sl.registerLazySingleton(
      () => FetchEmergencyContactsUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchInsuranceListUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreatePatientUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => CreatePContactDetailsUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => SaveEmergencyContactsUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveInsuranceListUseCase(repository: sl()));
  sl.registerLazySingleton(() => UploadImageUseCase(repository: sl()));

  // data sources
  sl.registerLazySingleton<PatientDataSource>(
    () => PatientDataSourceImpl(),
  );

  // repository
  sl.registerLazySingleton<PatientRepository>(
      () => PatientRepositoryImpl(patientDataSource: sl()));
}
