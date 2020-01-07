import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/services/storage/storage_service.dart';

import 'landing_data_source.dart';

class LandingDummyDataSourceImpl extends LandingDataSource {
  @override
  Future<User> getLoggedUser() async {
    StorageService _storageService = locator<StorageService>();

    bool ready = await _storageService.ready();

    if (ready) {
      User savedUser = await _storageService.getLoggedInUser();

      return savedUser;
    } else {
      return null;
    }
  }
}
