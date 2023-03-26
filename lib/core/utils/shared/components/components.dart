// ignore_for_file: non_constant_identifier_names, constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app/color_manager.dart';

// void navigateToRoute(context, {required String routeName}) {
//   Navigator.pushNamed(context, routeName);
// }

void navigateTo(context, {required routeName}) =>
    Navigator.pushNamed(context, routeName);

// void navigateTo2(context, {required routeName}) =>
//     Navigator.push(context, SlideRight(page: routeName));

void navigateAndFinish(context, {required routeName}) =>
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);

void showToast({required String text, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.Success:
      color = Colors.green;
      break;
    case ToastState.Error:
      color = Colors.red;
      break;
    case ToastState.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastState { Success, Error, Warning }

Size myMediaQuery({
  required BuildContext context,
}) {
  // debugPrint('${MediaQuery.of(context).size.height} this is mobile height');
  // debugPrint('${MediaQuery.of(context).size.width} this is mobile width');
  return MediaQuery.of(context).size;
}

SnackBar mySnackBar({required String myMessage}) => SnackBar(
      content: Text(
        textAlign: TextAlign.center,
        myMessage,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: ColorManager.error.withOpacity(0.5),
    );
