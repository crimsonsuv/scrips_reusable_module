import 'package:provider/provider.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/storage/storage_service.dart';

import 'locator.dart';
import 'services/api/authentication_service.dart';

// STEPS: Create providers

// get server access api from locator - either fakeAPi oir httpApi according to flag locator.USE_FAKE_IMPLEMENTATION
Api _api = locator<Api>();
StorageService _storageService = locator<StorageService>();

// providers which do not depend on any others - use Provider.value
List<SingleChildCloneableWidget> independentServices = [
  // server api
  Provider.value(value: _api),
  Provider.value(value: _storageService),
];

// providers which depend on others - use ProxyProviderNN
List<SingleChildCloneableWidget> dependentServices = [
  // Auth service
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) => AuthenticationService(api: api),
  )
];

// Stream Providers
List<SingleChildCloneableWidget> uiConsumableProviders = [
//  // change of Auth Service user
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  ),
];

// concatenate all services into one List for providing to App at root
List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];
