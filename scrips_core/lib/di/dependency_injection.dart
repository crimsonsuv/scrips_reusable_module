import 'package:get_it/get_it.dart';
import 'package:scrips_core/bloc/core_bloc.dart';
import 'package:scrips_core/common/data/datasources/common_data_source.dart';
import 'package:scrips_core/common/data/datasources/common_data_source_impl.dart';
import 'package:scrips_core/common/data/repository/common_repository_impl.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/common/domain/usecases/fetch_locations_by_placeid_use_case.dart';
import 'package:scrips_core/common/domain/usecases/fetch_locations_by_query_use_case.dart';
import 'package:scrips_core/common/domain/usecases/fetch_value_sets_use_case.dart';
import 'package:scrips_core/common/domain/usecases/verify_phone_use_case.dart';
import 'package:scrips_core/utils/dio_api_client.dart';

final coreSl = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = true;

Future<void> initCoreServiceLocator(
    {DioApiClient client, CoreBloc coreBloc}) async {
  /// Api Client
  coreSl.registerLazySingleton<DioApiClient>(() => client);

  /// Core
  // bloc
  coreSl.registerLazySingleton<CoreBloc>(() => coreBloc);

  ///Common
  //Use cases
  coreSl.registerLazySingleton(
      () => FetchLocationsByQueryUseCase(repository: coreSl()));
  coreSl.registerLazySingleton(
      () => FetchLocationsByPlaceIdUseCase(repository: coreSl()));
  coreSl.registerLazySingleton(() => VerifyPhoneUseCase(repository: coreSl()));
  coreSl
      .registerLazySingleton(() => FetchValueSetsUseCase(repository: coreSl()));

  // Data sources
  coreSl.registerLazySingleton<CommonDataSource>(() => CommonDataSourceImpl());

  // Repository
  coreSl.registerLazySingleton<CommonRepository>(
      () => CommonRepositoryImpl(commonDataSource: coreSl()));
}
