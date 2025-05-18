import 'dart:math';

import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

String getFileSizeString({required int bytes, int decimals = 0}) {
  if (bytes <= 0) return "0 ${LocaleKeys.byte.tr()}"; // Handle zero bytes

  var suffixes = [
    LocaleKeys.byte.tr(),
    LocaleKeys.kiloByte.tr(),
    LocaleKeys.megaByte.tr(),
    LocaleKeys.gigaByte.tr(),
    LocaleKeys.teraByte.tr(),
  ];

  int i = (log(bytes) / log(1024)).floor();
  double size = bytes / pow(1024, i);

  return "${size.toStringAsFixed(decimals)} ${suffixes[i]}";
}
