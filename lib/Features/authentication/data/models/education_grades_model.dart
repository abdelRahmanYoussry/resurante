import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/education_grade_entity.dart';

class EducationGradeModel extends EducationGradeEntity {
  EducationGradeModel(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  factory EducationGradeModel.fromJson(Map<String, dynamic> json) {
    return EducationGradeModel(
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
//

}
