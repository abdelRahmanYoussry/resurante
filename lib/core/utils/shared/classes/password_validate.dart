// ignore_for_file: body_might_complete_normally_nullable

import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

String? validatePassword(String? value) {
  String pattern =
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return LocaleKeys.passwordIsNotValid.tr();
  } else {
    return null;
  }
}
