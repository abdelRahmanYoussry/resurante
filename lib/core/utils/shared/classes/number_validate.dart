// ignore_for_file: body_might_complete_normally_nullable

import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

String? validateNumber(String? value) {
  String pattern = r'^\d+$';
  RegExp regex = RegExp(pattern);
  if (value == null ||
      value.isEmpty ||
      !regex.hasMatch(value) ||
      value.length != 14) {
    return LocaleKeys.numberIsNotValid.tr();
  } else {
    return null;
  }
}
