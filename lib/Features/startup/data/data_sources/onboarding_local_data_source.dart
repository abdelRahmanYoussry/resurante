// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/shared/app/strings_manager.dart';
import '../../domain/use_cases/change_language_use_case.dart';
import '../../domain/use_cases/update_boarding_view_use_case.dart';

abstract class BaseOnBoardingLocalDataSource {
  Future<bool> getLastOnBoarding();
  Future<bool> cacheOnBoarding(UpdateOnBoardingParameters parameters);
  Future<bool> changeLanguage(ChangeLanguageParameters parameters);
  Future<String> getSavedLanguage();
}

class OnBoardingLocalDataSource extends BaseOnBoardingLocalDataSource {
  final SharedPreferences sharedPreferences;
  OnBoardingLocalDataSource({required this.sharedPreferences});

  @override
  Future<bool> getLastOnBoarding() async {
    final boardingString =
        sharedPreferences.getBool(AppStrings.cachedOnBoarding) ?? false;
    return await Future.value(boardingString);
  }

  @override
  Future<bool> cacheOnBoarding(UpdateOnBoardingParameters parameters) async {
    return await sharedPreferences.setBool(
        AppStrings.cachedOnBoarding, parameters.isEnd);
  }

  @override
  Future<bool> changeLanguage(ChangeLanguageParameters parameters) async {
    return await sharedPreferences.setString(
        AppStrings.localCode, parameters.local);
  }

  @override
  Future<String> getSavedLanguage() async {
    return sharedPreferences.getString(AppStrings.localCode) ??
        AppStrings.englishCode;
    // return sharedPreferences.containsKey(AppStrings.localCode)
    //     ? sharedPreferences.getString(AppStrings.localCode)
    //     : AppStrings.englishCode;
  }
}
