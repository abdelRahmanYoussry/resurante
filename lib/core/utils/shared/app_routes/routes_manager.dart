import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resturente/Home/presentation/pages/home_screen.dart';
import 'package:resturente/Main/presentation/pages/main_screen.dart';

import '../../../../Splash/presentation/pages/splash_screen.dart';
import '../app/color_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';
import '../translations/locale_keys.g.dart';

/// understand how to this class work
//// add routes name as string like under
class Routes {
  static const String splashRoute = 'splash';
  static const String homeRoute = 'HomeScreen';
  static const String mainScreen = 'MainScreen';
}

/// this is main class to generate route dynamic in all app screens
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  /// this is the default route when there is no route in app
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: ColorManager.mainPrimaryColor4,
        appBar: AppBar(
          backgroundColor: ColorManager.mainPrimaryColor4,
          elevation: AppSize.size_0,
          centerTitle: true,
          title: Text(
            LocaleKeys.appName.tr(),
          ),
        ),
        body: Center(
          child: Text(
            LocaleKeys.noRoute.tr(),
            style: getBoldBlack24Style(
                // color: ColorManager.white,
                // fontSize: FontSize.size18,
                ),
          ),
        ),
      ),
    );
  }
}
