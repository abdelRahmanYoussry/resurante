import 'package:hassy/Features/authentication/domain/entities/education_systems_entitiy.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class EducationSystemModel extends EducationSystemsEntity {
  EducationSystemModel(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  factory EducationSystemModel.fromJson(Map<String, dynamic> json) {
    return EducationSystemModel(
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
