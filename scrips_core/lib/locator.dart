//scrips: sumeet: note: dart:io not supported on Web!
//import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/background_fetch_service.dart';
import 'package:scrips_core/services/api/fake_api.dart';
import 'package:scrips_core/services/api/http_api.dart';
import 'package:scrips_core/services/dialog/dialog_service.dart';
import 'package:scrips_core/services/storage/localstorage_service.dart';
import 'package:scrips_core/services/storage/storage_service.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerLazySingleton(() => BackgroundFetchService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton<Api>(() => USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi());
  // instantiate now itself so localStorage is available early
  LocalStorageService localStorageService = LocalStorageService();
  locator.registerSingleton<StorageService>(localStorageService);
  //
  WidgetsFlutterBinding.ensureInitialized();
  //scrips: sumeet: note dart:io not supported on Web!
//  // check which services are availablke in platform, and add them to providers and register in locator
//  if (Platform.isAndroid || Platform.isIOS) {
//    LocationService locationService = LocationService();
//    providers
//        .add(StreamProvider<UserLocation>(builder: (context) => locationService.locationStream));
//    locator.registerLazySingleton(() => locationService);
//  } else {
//    print('Not Instantiaing Locator Service for Platform ${Platform.operatingSystem}');
//    print('Not registering Locator Service for Platform ${Platform.operatingSystem}');
//  }
}
