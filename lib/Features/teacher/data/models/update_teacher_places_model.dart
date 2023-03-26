
import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/update_teacher_place_entity.dart';

class UpdateTeacherPlacesModel extends UpdateTeacherPlacesEntity {
  UpdateTeacherPlacesModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory UpdateTeacherPlacesModel.fromJson(Map<String, dynamic> json) {
    return UpdateTeacherPlacesModel(
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
