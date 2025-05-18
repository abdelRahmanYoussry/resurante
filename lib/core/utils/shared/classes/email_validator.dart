// ignore_for_file: body_might_complete_normally_nullable

import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return LocaleKeys.emailIsUnValid.tr();
  } else {
    return null;
  }
}
