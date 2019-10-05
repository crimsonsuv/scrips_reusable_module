import 'package:provider/provider.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/fake_api.dart';
import 'package:scrips_core/services/api/http_api.dart';
import 'package:scrips_core/services/storage/localstorage_service.dart';
import 'package:scrips_core/services/storage/storage_service.dart';

const bool USE_FAKE_IMPLEMENTATION = true;

List<SingleChildCloneableWidget> provders = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];
List<SingleChildCloneableWidget> independentServices = [
  Provider<StorageService>.value(value: LocalStorageService()),
  Provider<Api>.value(value: USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi())
];
List<SingleChildCloneableWidget> dependentServices = [];
List<SingleChildCloneableWidget> uiConsumableProviders = [];
