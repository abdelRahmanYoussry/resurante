// ignore_for_file: file_names

import 'package:hassy/Features/authentication/domain/entities/verification_register_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class VerificationRegisterModel extends VerificationRegisterEntity {
  VerificationRegisterModel(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      // required super.userId,
      // required super.verificationCode,
      required super.statusCode});

  factory VerificationRegisterModel.fromJson(Map<String, dynamic> json) {
    return VerificationRegisterModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: json['data'].toString(),
      // verificationCode: json['verificationCode'],
      // userId: json['userId'],
    );
  }
//
}
