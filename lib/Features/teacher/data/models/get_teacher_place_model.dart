import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/get_teacher_places_entity.dart';

class GetTeacherPlaceModel extends GetTeacherPlaceEntity {
  GetTeacherPlaceModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.teacherPlacesData,
  });
  factory GetTeacherPlaceModel.fromJson(Map<String, dynamic> json) {
    return GetTeacherPlaceModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      teacherPlacesData: (json['data'] as List)
          .map((e) => TeacherPlacesData.fromJson(e))
          .toList(),
    );
  }
}

class TeacherPlacesData {
  int? id;
  String? name;
  String? countryName;
  String? areaName;
  String? cityName;
  int? countryId;
  int? cityId;
  int? areaId;
  String? streetName;
  String? longitude;
  String? latitude;

  TeacherPlacesData({
    this.id,
    this.name,
    this.countryId,
    this.cityId,
    this.streetName,
    this.longitude,
    this.areaId,
    this.latitude,
    this.areaName,
  });

  TeacherPlacesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryName = json['countryName'];
    cityName = json['cityName'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    areaId = json['areaId'];
    streetName = json['streetName'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    areaName = json['areaName'];
  }
}
