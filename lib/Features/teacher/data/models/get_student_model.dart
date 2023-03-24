// ignore_for_file: unused_import, unnecessary_null_in_if_null_operators

import 'package:hassy/Features/authentication/domain/entities/uesr_data_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_student_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../../../core/utils/network/base_data_entity.dart';

class StudentModel extends GetStudentEntity {
  StudentModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.studentData,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      studentData:
          (json['data'] as List).map((e) => StudentData.fromJson(e)).toList(),
    );
  }
}

class StudentData {
  String? address;
  String? studentImagePath;
  int? id;
  String? name;
  String? phone;
  bool? isActive;
  StudentData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
    address = json['address'];
    studentImagePath = json['imagePath'];
    id = json['id'];
    phone = json['phone'];
  }
}
