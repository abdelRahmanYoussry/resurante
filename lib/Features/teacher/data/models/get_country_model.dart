import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/get_country_entity.dart';

class GetCountryModel extends GetCountryEntity {
  GetCountryModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.countryData,
    // required super.lessonTypeData,
  });
  factory GetCountryModel.fromJson(Map<String, dynamic> json) {
    return GetCountryModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      countryData:
          (json['data'] as List).map((e) => LocationData.fromJson(e)).toList(),
    );
  }
}

class LocationData {
  int? id;
  String? name;

  LocationData({this.id, this.name});

  LocationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
