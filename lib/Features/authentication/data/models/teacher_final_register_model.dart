import 'package:hassy/Features/authentication/domain/entities/teacher_fianl_register_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class TeacherFinalRegisterModel extends TeacherFinalRegisterEntity {
  TeacherFinalRegisterModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory TeacherFinalRegisterModel.fromJson(Map<String, dynamic> json) {
    return TeacherFinalRegisterModel(
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
