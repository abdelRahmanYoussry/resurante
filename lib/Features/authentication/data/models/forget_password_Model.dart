// ignore_for_file: file_names

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPasswordEntity {
  ForgetPasswordModel({
    super.data,
    required super.message,
    required super.statusCode,
    required super.brokenRules,
    required super.isErrorMessageJson,
    required super.succeeded,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: json['data'].toString(),
    );
  }
}
