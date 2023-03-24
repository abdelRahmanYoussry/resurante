import 'package:hassy/Features/teacher/domain/entities/get_lesson_type_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class GetLessonTypeModel extends GetLessonTypeEntity {
  GetLessonTypeModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.lessonTypeData,
  });
  factory GetLessonTypeModel.fromJson(Map<String, dynamic> json) {
    return GetLessonTypeModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      lessonTypeData: (json['data'] as List)
          .map((e) => LessonTypeData.fromJson(e))
          .toList(),
    );
  }
}

class LessonTypeData {
  int? id;
  String? name;
  LessonTypeData({this.id, this.name});
  LessonTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
