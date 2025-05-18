// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../services/services_locator.dart';
//
// class CacheHelper {
//   static dynamic getData({required String key}) {
//     return serviceLocator<SharedPreferences>().get(key);
//   }
//
//   static Future<bool> saveData(
//       {required String key, required dynamic value}) async {
//     if (value is String) {
//       return await serviceLocator<SharedPreferences>().setString(key, value);
//     }
//     // if(value is MaterialColor){
//     //   return await sl<SharedPreferences>().set
//     // }
//     if (value is int) {
//       return await serviceLocator<SharedPreferences>().setInt(key, value);
//     }
//     if (value is bool) {
//       return await serviceLocator<SharedPreferences>().setBool(key, value);
//     }
//     if(value is Map<String,dynamic>){
//       return await serviceLocator<SharedPreferences>().setString(key, jsonEncode(value));
//     }
//     return await serviceLocator<SharedPreferences>().setDouble(key, value);
//   }
//
//   static Future<bool> removeData({required String key}) async {
//     return serviceLocator<SharedPreferences>().remove(key);
//   }
// }
