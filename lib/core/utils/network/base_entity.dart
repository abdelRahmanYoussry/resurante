import 'package:resturente/core/utils/network/base_broken_rules_entity.dart';

class BaseEntityResponse {
  dynamic data;
  final bool succeeded;
  final String message;
  final bool isErrorMessageJson;
  final List<BaseBrokenRulesEntity> brokenRules;
  final int statusCode;
  BaseEntityResponse({
    required this.data,
    required this.succeeded,
    required this.message,
    required this.isErrorMessageJson,
    required this.brokenRules,
    required this.statusCode,
  });
}
