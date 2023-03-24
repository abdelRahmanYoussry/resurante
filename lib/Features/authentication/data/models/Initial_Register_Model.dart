// ignore_for_file: file_names

import 'package:hassy/core/utils/network/base_broken_rules_entity.dart';

import '../../domain/entities/Register_initial_entitiy.dart';

class InitialRegisterModel extends InitialRegisterEntity {
  InitialRegisterModel({
    super.data,
    required super.message,
    required super.statusCode,
    required super.brokenRules,
    required super.isErrorMessageJson,
    required super.typeId,
    required super.phone,
    required super.userName,
    required super.succeeded,
    required super.password,
    required super.passwordConfirm,
  });

  factory InitialRegisterModel.fromJson(Map<String, dynamic> json) {
    return InitialRegisterModel(
      phone: json['phone'].toString(),
      password: json['password'].toString(),
      passwordConfirm: json['passwordConfirm'].toString(),
      userName: json['userName'].toString(),
      typeId: json['typeId'].toString(),
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
      'phone': phone,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'userName': userName,
      'typeId': typeId,
      'data': data,
      'succeeded': succeeded,
      'isErrorMessageJson': isErrorMessageJson,
      'message': message,
      'brokenRules': brokenRules,
      'statusCode': statusCode,
    };
  }
}
