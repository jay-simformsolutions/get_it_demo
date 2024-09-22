import 'package:get_it_demo/values/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper() {
    init();
  }

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int? gerReadCount() {
    return _prefs.getInt(StringConstants.kReadCount) ?? 0;
  }

  Future<bool> setReadCount(int count) {
    return _prefs.setInt(StringConstants.kReadCount, count);
  }

// String? getLoginUserName() {
//   return _prefs.getString(StringConstants.kLoginUser);
// }
//
// void setLoginUser(String username) async {
//   await _prefs.setString(StringConstants.kLoginUser, username);
// }
//
// void setLoginPassword(String password) async {
//   await _prefs.setString(StringConstants.kLoginPass, password);
// }
}
