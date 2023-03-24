import 'package:shared_preferences/shared_preferences.dart';

import '../../services/services_locator.dart';

class CacheHelper {
  static dynamic getSharedPreferencesValue({required String key}) {
    return sl<SharedPreferences>().get(key);
  }

  static Future<bool> saveDataToSharedPreferences(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sl<SharedPreferences>().setString(key, value);
    }
    // if(value is MaterialColor){
    //   return await sl<SharedPreferences>().set
    // }
    if (value is int) return await sl<SharedPreferences>().setInt(key, value);
    if (value is bool) return await sl<SharedPreferences>().setBool(key, value);
    return await sl<SharedPreferences>().setDouble(key, value);
  }

  static Future<bool> removeDataFromSharedPreferences(
      {required String key}) async {
    return sl<SharedPreferences>().remove(key);
  }
}
