import 'dart:convert' as json;

bool validString(dynamic src) => src?.toString().isNotEmpty == true;

String prettify(val) => const json.JsonEncoder.withIndent('  ').convert(val);
