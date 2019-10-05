import 'package:get_it/get_it.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/background_fetch_service.dart';
import 'package:scrips_core/services/api/fake_api.dart';
import 'package:scrips_core/services/api/http_api.dart';
import 'package:scrips_core/services/api/location_service.dart';
import 'package:scrips_core/services/dialog/dialog_service.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroundFetchService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton<Api>(() => USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi());
}
