// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';

import '../../../../core/utils/shared/app/color_manager.dart';
import '../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../core/utils/shared/components/components.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  Color myColor = CacheHelper.getSharedPreferencesValue(key: 'mainColor') ??
      Color(0Xff439A97);
  bool isDark = CacheHelper.getSharedPreferencesValue(key: 'isDark') ?? false;
  void changeNavBar(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      emit(ChangeNavBarState0());
    } else if (currentIndex == 1) {
      emit(ChangeNavBarState1());
    } else {
      emit(ChangeNavBarState2());
    }
  }

  void changeThemeMode({bool? isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isDark = isDarkFromShared;
      // debugPrint(isDark.toString());
      CacheHelper.saveDataToSharedPreferences(key: 'isDark', value: isDark);
      // debugPrint('${AppStrings.isDark()}  this is fromShared');
      emit(ChangeThemeModeSuccess());
    } else {
      isDark = !isDark;
      CacheHelper.saveDataToSharedPreferences(key: 'isDark', value: isDark)
          .then((value) {
        // debugPrint('${AppStrings.isDark()}this is fromShared');
        emit(ChangeThemeModeSuccess());
      });
    }

    emit(ChangeThemeModeSuccess());
  }

  Color changeColorStyle({required Color color}) {
    myColor = color;
    ColorManager.mainPrimaryColor4 = color;
    print(ColorManager.mainPrimaryColor4.toString());
    // CacheHelper.saveDataToSharedPreferences(key: 'mainColor', value: color);
    emit(ChangeStyleColorSuccessState());
    return myColor;
  }

  Future<void> removeValueFromShared({required String key}) async {
    CacheHelper.removeDataFromSharedPreferences(key: key);
    var x = CacheHelper.getSharedPreferencesValue(key: key);
    emit(RemoveValueFromSharedSuccessState());
    debugPrint(x);
  }

  Future<void> signOut({required BuildContext context}) async {
    removeValueFromShared(key: AppStrings.userToken);
    navigateAndFinish(context, routeName: Routes.loginRoute);
    emit(SignOutSuccessState());
  }
}
