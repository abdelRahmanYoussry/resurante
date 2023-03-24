// ignore_for_file: file_names

import 'package:hassy/Features/authentication/domain/entities/initial_forget_password_entity.dart';
import 'package:hassy/core/utils/network/base_broken_rules_entity.dart';

class InitialForgetPasswordModel extends InitialForgetPasswordEntity {
  InitialForgetPasswordModel({
    super.data,
    required super.message,
    required super.statusCode,
    required super.brokenRules,
    required super.isErrorMessageJson,
    // required super.typeId,
    // required super.phone,
    // required super.userName,
    required super.succeeded,
    // required super.password,
    // required super.passwordConfirm,
  });

  factory InitialForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return InitialForgetPasswordModel(
      // phone: json['phone'].toString(),
      // password: json['password'].toString(),
      // passwordConfirm: json['passwordConfirm'].toString(),
      // userName: json['userName'].toString(),
      // typeId: json['typeId'].toString(),
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
  Map<String, dynamic> toMap() {
    return {
      // 'phone': phone,
      // 'password': password,
      // 'passwordConfirm': passwordConfirm,
      // 'userName': userName,
      // 'typeId': typeId,
      'data': data,
      'succeeded': succeeded,
      'isErrorMessageJson': isErrorMessageJson,
      'message': message,
      'brokenRules': brokenRules,
      'statusCode': statusCode,
    };
  }
}
