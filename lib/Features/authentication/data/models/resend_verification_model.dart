// ignore_for_file: file_names

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/resend_verification_code_entity.dart';

class ResendVerificationModel extends ResendVerificationEntity {
  ResendVerificationModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });

  factory ResendVerificationModel.fromJson(Map<String, dynamic> json) {
    return ResendVerificationModel(
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
//
}
