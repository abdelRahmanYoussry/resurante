// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

String? validateYear(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{4}$)';
  RegExp regex = RegExp(pattern);

  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return LocaleKeys.yearErrorText.tr();
  } else {
    return null;
  }
}
