import 'package:hassy/Features/teacher/domain/entities/get_cities_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import 'get_country_model.dart';

class GetCitiesModel extends GetCitiesEntity {
  GetCitiesModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.locationData,
  });
  factory GetCitiesModel.fromJson(Map<String, dynamic> json) {
    return GetCitiesModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      locationData:
          (json['data'] as List).map((e) => LocationData.fromJson(e)).toList(),
    );
  }
}
