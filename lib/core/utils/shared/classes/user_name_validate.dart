// ignore_for_file: body_might_complete_normally_nullable

import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

String? validateStringWithNumber(String? value) {
  String pattern = r'^[a-zA-Z\s]*$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return LocaleKeys.userNameIsNotValid.tr();
  } else {
    return null;
  }
}
