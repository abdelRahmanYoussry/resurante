import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/teacher_update_basic_data_entity.dart';

class TeacherUpdateBasicDataModel extends UpdateBasicUserDataEntity {
  TeacherUpdateBasicDataModel({
    required super.data,
    required super.name,
    required super.address,
    required super.birthDate,
    required super.email,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory TeacherUpdateBasicDataModel.fromJson(Map<String, dynamic> json) {
    return TeacherUpdateBasicDataModel(
      birthDate: json['birthDate'].toString(),
      address: json['address'].toString(),
      email: json['email'].toString(),
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: json['data'].toString(),
      name: json['name'].toString(),
    );
  }
}
