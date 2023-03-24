// ignore_for_file: file_names

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/verification_forgetPassword_entity.dart';

class VerificationForgetPasswordModel extends VerificationForgetPasswordEntity {
  VerificationForgetPasswordModel(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.verificationForgetPassword,

      // required super.userId,
      // required super.verificationCode,
      required super.statusCode});

  factory VerificationForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return VerificationForgetPasswordModel(
        succeeded: json['succeeded'],
        message: json['message'].toString(),
        brokenRules: (json['brokenRules'] as List)
            .map((e) => BaseBrokenRulesEntity.fromJson(e))
            .toList(),
        isErrorMessageJson: json['isErrorMessageJson'],
        statusCode: json['statusCode'],
        data: json['data'].toString(),
        verificationForgetPassword:
            VerificationForgetPassword.fromJson(json['data'])
        // verificationCode: json['verificationCode'],
        // userId: json['userId'],
        );
  }
//
}

class VerificationForgetPassword {
  String? token;
  int? userId;

  VerificationForgetPassword.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
  }
}
