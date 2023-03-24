import 'package:hassy/Features/authentication/domain/entities/Register_Step2_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class RegisterStepTwoModel extends RegisterStepTwoEntity {
  RegisterStepTwoModel({
    required super.data,
    required super.fullName,
    required super.idNumber,
    required super.address,
    required super.birthDate,
    required super.email,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory RegisterStepTwoModel.fromJson(Map<String, dynamic> json) {
    return RegisterStepTwoModel(
      fullName: json['Name'].toString(),
      birthDate: json['BirthDate'].toString(),
      address: json['Address'].toString(),
      email: json['Email'].toString(),
      idNumber: json['IdNumber'].toString(),
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
