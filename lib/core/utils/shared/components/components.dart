import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/values_manager.dart';

Future<void> navigateTo(BuildContext context,
    {required String routeName, Object? arguments}) async {
  log('NavigationServiceName: $routeName');
  await Navigator.pushNamed(context, routeName, arguments: arguments);
}

void navigateAndFinish(context, {required routeName, Object? arguments}) {
  log('NavigationServiceName: $routeName');
  Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false,
      arguments: arguments);
}

Future<void> navigateAndFinishWithoutRoute(context, widget) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);

Future<T?> navigateToWithoutRoute<T>(BuildContext context,
    {required Widget widget}) async {
  return await Navigator.push<T>(
      context, MaterialPageRoute(builder: (context) => widget));
}

FToast? fToast;

void showToastNew(
    {required String text,
    required ToastState state,
    required BuildContext context}) {
  FToast fToast = FToast();
  fToast.init(context);
  fToast.showToast(
    child: Container(
      width: myMediaQuery(context: context).width,
      // height: AppSize.size50.h,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(1.00, -0.08),
          end: const Alignment(-1, 0.08),
          colors: state == ToastState.success
              ? [const Color(0xFF32BA71), const Color(0xFF2A9D8F)]
              : [const Color(0xFFF6743E), const Color(0xFFD42424)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: state == ToastState.success
                  ? const Color(0xFF43D590)
                  : const Color(0xFFF0863A)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'DIN Next LT Arabic',
          fontWeight: FontWeight.w700,
          // height: 1.2,
        ),
      ),
    ),
    toastDuration: const Duration(seconds: 2),
    positionedToastBuilder: (context, child) {
      return Positioned(
        // top: 16.0,
        bottom: 10.0,
        width: myMediaQuery(context: context).width,
        child: child,
      );
    },
  );
}

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastState { success, error, warning }

Size myMediaQuery({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size;
}

SnackBar mySnackBar({required String myMessage, required bool isError}) =>
    SnackBar(
      // width:
      // myMediaQuery(context: NavigationService.navigatorKey.currentContext!)
      //     .width,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.padding10),
      // margin: const EdgeInsets.symmetric(vertical: AppPadding.padding10),
      content: Text(
        textAlign: TextAlign.center,
        myMessage,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: isError
          ? ColorManager.error.withOpacity(0.5)
          : ColorManager.mainPrimaryColor4,
    );

DateTime currentDateTime() => DateTime.now();

String splitStringEveryFourDigits(String input) {
  // Remove any existing hyphens or spaces if necessary
  input = input.replaceAll(RegExp(r'[^0-9]'), '');

  List<String> chunks = [];

  for (int i = 0; i < input.length; i += 4) {
    // Get a substring of length 4 starting from index i
    chunks.add(input.substring(i, i + 4 > input.length ? input.length : i + 4));
  }

  // Join the chunks with '-' separator
  return chunks.join('-');
}

String lessonDateFormat(DateTime date) {
  return DateFormat('dd-MM-yyyy', 'en').format(date);
}

String lessonTimeFormat(DateTime date) {
  return DateFormat.jm('en').format(date);
}
