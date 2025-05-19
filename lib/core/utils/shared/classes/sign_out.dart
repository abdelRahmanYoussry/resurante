// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:resturente/core/utils/shared/app/color_manager.dart';
// import 'package:resturente/core/utils/shared/app/styles_manager.dart';
//
// import '../app/navigation_service.dart';
// import '../app/strings_manager.dart';
// import '../app_routes/routes_manager.dart';
// import '../components/components.dart';
// import '../translations/locale_keys.g.dart';
//
// Future<void> invalidToken() async {
//   removeValueFromShared(key: AppStrings.userToken);
//   removeValueFromShared(key: AppStrings.registerTypeNumber);
//   print(AppStrings.userToken);
//   navigateAndFinish(
//     NavigationService.navigatorKey.currentContext,
//     routeName: Routes.loginRoute,
//   );
//   Fluttertoast.showToast(
//     msg: 'Status code : 401 Unauthorized error Please Sign In Again',
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: ColorManager.error,
//     textColor: ColorManager.white,
//     fontSize: getBoldWhite12Style().fontSize,
//   );
// }
//
// Future<void> signOut({required BuildContext context}) async {
//   await removeValueFromShared(key: AppStrings.userToken);
//   await removeValueFromShared(key: AppStrings.registerTypeNumber);
//   navigateAndFinish(
//     context,
//     routeName: Routes.loginRoute,
//   );
//   // print(CacheHelper.getData(key: AppStrings.userToken));
//   Fluttertoast.showToast(
//     msg: LocaleKeys.logOutMessage.tr(),
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: ColorManager.greenColor,
//     textColor: ColorManager.white,
//     fontSize: getBoldWhite12Style().fontSize,
//   );
// }
//
// Future<void> removeValueFromShared({required String key}) async {
//   // CacheHelper.removeData(key: key);
// }
