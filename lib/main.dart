import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/Splash/presentation/pages/splash_screen.dart';
import 'package:resturente/core/utils/shared/style/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          theme: lightTheme,
          // navigatorKey: NavigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          // onGenerateRoute: RouteGenerator.getRoute,
          // initialRoute: Routes.splashRoute,
          // builder: (context, child) {
          //   return NoInternetConnection(
          //     connectionWidget: child ?? const SizedBox.shrink(),
          //   );
          // },
        );
      },
    );
  }
}
