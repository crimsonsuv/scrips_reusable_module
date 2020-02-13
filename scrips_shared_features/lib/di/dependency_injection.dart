import 'package:get_it/get_it.dart';
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
}
