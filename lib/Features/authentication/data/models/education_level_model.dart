import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/education_level_entity.dart';

class EducationLevelModel extends EducationLevelEntity {
  EducationLevelModel(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  factory EducationLevelModel.fromJson(Map<String, dynamic> json) {
    return EducationLevelModel(
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
