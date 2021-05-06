import 'package:shared_preferences/shared_preferences.dart';

/// Singleton helper class for storing and fetching persistent data
/// via KEY-VALUE in synchronous manner
///
/// Create unique keys in this class and handle default cases
///
/// Note this utils require plugin to work
/// In pubspec.ymal add this line in dependencies
/// shared_preferences:
///
///  main(){
///    SharedPreferences.getInstance().then((pref){
///    AppPreferenceUtil(pref: pref);
///    runApp(MyApp());
///   });
/// }
///
/// Reading value
///   bool isFirstTime = AppPreferenceUtil().readBool(AppPreferenceUtil.firstTimeAppOpen);
///
/// Writing value
///   AppPreferenceUtil().writeBool(AppPreferenceUtil.firstTimeAppOpen, false);
///
class AppPreferenceUtil extends PreferenceUtil {
  /// TODO: Add unique keys(integer) here
  //static const int accessToken = 1;
  static const int refreshToken = 2;
  static const int notificationAction = 3;

//  static const int userId = 2;
//  static const int rememberMe = 3;
//  so on...

  static final AppPreferenceUtil _singleton = AppPreferenceUtil._internal();

  /// Initialize first time will valid pref in [main] method
  ///
  /// import 'package:shared_preferences/shared_preferences.dart';
  ///
  ///  main(){
  ///    SharedPreferences.getInstance().then((pref){
  ///    AppPreferenceUtil(pref: pref);
  ///    runApp(MyApp());
  ///   });
  /// }
  ///

  factory AppPreferenceUtil({SharedPreferences pref}) {
    if (pref != null) _singleton._prefs = pref;

    assert(_singleton.prefs != null,
        "AppPreferenceUtil should be initialized with onetime with SharedPreference instance before using it. Check above documentaton on how to initialize.");

    return _singleton;
  }

  AppPreferenceUtil._internal() : super(null);

  /// override this function to handle default case
  bool readBool(key) {
    var result = super.readBool(key);

    // result will be null if it is  accessed first time,
    // handling of default case
    if (result == null) {
      switch (key) {
      }
    }

    // making default value false
    return result ?? false;
  }
}

/// Persistent data helper class,
/// makes data read operation synchronous
class PreferenceUtil {
  SharedPreferences _prefs;

  PreferenceUtil(this._prefs);

  bool readBool(dynamic key) {
    return _prefs.getBool("$key");
  }

  int readInt(dynamic key) {
    return _prefs.getInt("$key") ?? 0;
  }

  String readString(dynamic key) {
    return _prefs.getString(key.toString()) ?? "";
  }

  Future<bool> writeBool(int key, bool value) async {
    return await _prefs.setBool("$key", value);
  }

  Future<bool> writeInt(String key, int value) async {
    return await _prefs.setInt("$key", value);
  }

  Future<bool> writeString(dynamic key, String value) async {
    return await _prefs.setString("$key", value);
  }

  SharedPreferences get prefs => _prefs;
}
