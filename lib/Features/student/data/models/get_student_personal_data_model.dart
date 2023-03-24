import 'package:hassy/Features/student/domain/entities/student_personal_data_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class GetStudentPersonalDataModel extends StudentPersonalDataEntity {
  GetStudentPersonalDataModel(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});
  factory GetStudentPersonalDataModel.fromJson(Map<String, dynamic> json) {
    return GetStudentPersonalDataModel(
        succeeded: json['succeeded'],
        message: json['message'].toString(),
        brokenRules: (json['brokenRules'] as List)
            .map((e) => BaseBrokenRulesEntity.fromJson(e))
            .toList(),
        isErrorMessageJson: json['isErrorMessageJson'],
        statusCode: json['statusCode'],
        data: json['data']
        // (json['data'] as List)
        //     .map((e) => DropDownEntity.fromJson(e))
        //     .toList(),
        );
  }
}
