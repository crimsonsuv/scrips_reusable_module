import 'package:get_it/get_it.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source_impl.dart';
import 'package:scrips_shared_features/features/create_password/data/repository/create_password_repository_impl.dart';
import 'package:scrips_shared_features/features/create_password/domain/repository/create_password_repository.dart';
import 'package:scrips_shared_features/features/create_password/domain/usecase/create_password_use_case.dart';
import 'package:scrips_shared_features/features/create_password/presentation/bloc/create_password/create_password_bloc.dart';
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
import 'package:scrips_shared_features/features/login/data/datasources/login_dummy_data_source_impl.dart';
import 'package:scrips_shared_features/features/login/data/repository/login_repository_impl.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/get_login_response_use_case.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:scrips_shared_features/features/password_changed_success/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/reset_password_access_code/presentation/bloc/reset_password_access_code_bloc.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source_impl.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_dummy_data_source_impl.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/repository/sign_up_repository_impl.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/repository/sign_up_repository.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/usecases/signup_by_code_use_case.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/reset_password_new_password/presentation/bloc/bloc.dart';

final sl = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = true;

Future<void> initServiceLocator() async {
  /// Features
  /// Landing
  //bloc
  sl.registerFactory(() => LandingBloc(getLoggedUserUseCase: sl()));

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
  sl.registerFactory(
    () => LoginBloc(loginResponseUseCase: sl()),
  );

  // use cases
  sl.registerLazySingleton(
      () => GetLoginResponseUseCase(loginRepository: sl()));

  // Data sources
  sl.registerLazySingleton<LoginDataSource>(() => USE_FAKE_IMPLEMENTATION
      ? LoginDummyDataSourceImpl()
      : LoginDataSourceImpl());

  // repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        loginDataSource: sl(),
      ));

  /// Sign Up
  // bloc
  sl.registerFactory(() => SignupWithAccessCodeBloc(signupByCodeUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => SignupByCodeUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<SignUpDataSource>(() => SignUpDataSourceImpl());

  // repository
  sl.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataSource: sl()));

  /// Create Password
  //bloc
  sl.registerFactory(() => CreatePasswordBloc(createPasswordUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => CreatePasswordUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<CreatePasswordDataSource>(
      () => CreatePasswordDataSourceImpl());

  // repository
  sl.registerLazySingleton<CreatePasswordRepository>(
      () => CreatePasswordRepositoryImpl(createPasswordDataSource: sl()));

  /// Forgot Password
  //bloc
  sl.registerFactory(() => ForgotPasswordBloc());

  // use cases

  // Data sources

  // repository

  /// Reset Password Access code
  //bloc
  sl.registerFactory(() => ResetPasswordAccessCodeBloc());

  // use cases

  // Data sources

  // repository

  /// Reset Password New Password
  //bloc
  sl.registerFactory(() => ResetPasswordNewPasswordBloc());

  // use cases

  // Data sources

  // repository

  /// Password Changed Success
  //bloc
  sl.registerFactory(() => PasswordChangedSuccessBloc());

  // use cases

  // Data sources

  // repository
}
