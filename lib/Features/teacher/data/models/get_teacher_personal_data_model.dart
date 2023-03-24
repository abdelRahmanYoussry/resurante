// ignore_for_file: unused_import, unnecessary_null_in_if_null_operators

import 'package:hassy/Features/authentication/domain/entities/uesr_data_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../../../core/utils/network/base_data_entity.dart';
import '../../domain/entities/get_teacher_personal_data_entity.dart';

class TeacherPersonalDataModel extends GetTeacherPersonalEntity {
  TeacherPersonalDataModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.teacherPersonalData,
  });

  factory TeacherPersonalDataModel.fromJson(Map<String, dynamic> json) {
    return TeacherPersonalDataModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      teacherPersonalData: TeacherPersonalData.fromJson(json['data']),
    );
  }
}

class TeacherPersonalData {
  String? qualificationCertificateName;
  int? qualificationYear;

  List<Materials>? materials;
  List<Attachments>? attachments;

  TeacherPersonalData({
    this.qualificationCertificateName,
    this.qualificationYear,
    this.materials,
    this.attachments,
  });

  TeacherPersonalData.fromJson(Map<String, dynamic> json) {
    qualificationCertificateName = json['qualificationCertificateName'];
    qualificationYear = json['qualificationYear'];
    if (json['materials'] != null) {
      materials = <Materials>[];
      json['materials'].forEach((v) {
        materials!.add(Materials.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachments.fromJson(v));
      });
    }
  }
}

class Materials {
  int? id;
  String? name;
  Materials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Attachments {
  int? typeId;
  String? name;
  String? path;
  int? id;

  Attachments.fromJson(Map<String, dynamic> json) {
    typeId = json['typeId'];
    name = json['name'];
    path = json['path'];
    id = json['id'];
  }
}
