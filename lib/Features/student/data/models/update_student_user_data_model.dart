import 'package:hassy/Features/student/domain/entities/update_student_user_data_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class UpdateStudentDataModel extends UpdateStudentUserDataEntity {
  UpdateStudentDataModel(
      {required super.data,
      // required super.eductionGradeId,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  factory UpdateStudentDataModel.fromJson(Map<String, dynamic> json) {
    return UpdateStudentDataModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: json['data'],
      // eductionGradeId: json['eductionGradeId']
    );
  }
}
