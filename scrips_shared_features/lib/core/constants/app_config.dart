import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';

class Configuration {
  static Map<String, dynamic> _config = Map<String, dynamic>();

  static Future<bool> loadConfig() async {
    try {
      // get config as json
      String content =
          await rootBundle.loadString(FilePaths.globalConfigFilePath);
      Map<String, dynamic> configAsMap = json.decode(content);

      //examine env and Set config to proper config env>
      String processEnvType = const String.fromEnvironment('ENV',
              defaultValue:
                  const String.fromEnvironment('env', defaultValue: 'dev'))
          ?.toLowerCase();

      // use correct env config
      _config = configAsMap[processEnvType] ?? Map<String, dynamic>();
    } catch (ex) {
      debugLog('Error: Configuration::loadConfig ${ex.toString()}');
      _config = Map<String, dynamic>();
    }
    return true;
  }

  static String get envType {
    return _config['env_type'] ?? 'dev';
  }

  static bool get goToHomeIfLoggedIn {
    return _config['go_to_home_if_logged_in'] as bool ?? true;
  }

  static String get defaultLoginSignUpScreen {
    return _config['default-login-sign-up-screen'] as String ??
        AppRoutePaths.Landing;
  }

  static String get initialRoute {
    return _config['initial-route'] as String ?? AppRoutePaths.Landing;
  }

  static String get dummyUserName {
    return _config['dummy_user_name'] as String ?? '';
  }

  static String get dummyUserPassword {
    return _config['dummy_user_password'] as String ?? '';
  }

  static String get initialRouteExperimentalPlatforms {
    return _config['initial-route-experimental-platforms'] as String ??
        AppRoutePaths.Landing;
  }
}
