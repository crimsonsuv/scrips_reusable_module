import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/data_models/general/global.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'core_event.dart';

part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  Global data = Global();

  CoreBloc() : super(InitialCoreState());

  @override
  Stream<CoreState> mapEventToState(CoreEvent event) async* {
    if (event is GetLocaleEvent) {
      yield GetLocaleState(data: data);
    } else if (event is SetNewLocalEvent) {
      setNewLocale(event.localeCode, event.localeCountry);
      yield SetNewLocalState(data);
    } else if (event is UserDataUpdateEvent) {
      SharedPreferences.getInstance().then((sp) {
        sp.setString(currentAppType == AppType.PM
            ? scripsLoggedPMUser
            : (currentAppType == AppType.PA
            ? scripsLoggedPAUser
            : scripsLoggedUAUser), jsonEncode(event.userData.toJson()));
        sp.setString(
            currentAppType == AppType.PM
                ? scripsLoggedPMUser
                : (currentAppType == AppType.PA
                    ? scripsLoggedPAUser
                    : scripsLoggedUAUser),
            jsonEncode(event.userData.toJson()));
      });

      yield UserDataUpdateState(userData: event.userData);
    } else if (event is UploadProgressEvent) {
      print("core-->${event.progress}");
      yield UploadProgressState(progress: event.progress);
    } else if (event is DashboardMenuClickEvent) {
      yield DashboardMenuClickState(menu: event.menu);
    }
  }

  void setNewLocale(String localeCode, String localeCountry) {
    this.data.localeCode = localeCode;
    this.data.localeCountry = localeCountry;
  }
}
