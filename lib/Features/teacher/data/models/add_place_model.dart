import 'package:hassy/Features/teacher/domain/entities/add_place_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class AddPlaceModel extends AddPlaceEntity {
  AddPlaceModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory AddPlaceModel.fromJson(Map<String, dynamic> json) {
    return AddPlaceModel(
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
