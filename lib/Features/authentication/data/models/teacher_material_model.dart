// ignore_for_file: unused_import, unnecessary_null_in_if_null_operators

import 'package:hassy/Features/authentication/domain/entities/get_material_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/uesr_data_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../../../core/utils/network/base_data_entity.dart';

class TeacherMaterialModel extends TeacherMaterialEntity {
  TeacherMaterialModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.materials,
  });
  factory TeacherMaterialModel.fromJson(Map<String, dynamic> json) {
    return TeacherMaterialModel(
        succeeded: json['succeeded'],
        message: json['message'].toString(),
        brokenRules: (json['brokenRules'] as List)
            .map((e) => BaseBrokenRulesEntity.fromJson(e))
            .toList(),
        isErrorMessageJson: json['isErrorMessageJson'],
        statusCode: json['statusCode'],
        data: [],
        // userData: (json['data']).map((e) => UserData.fromJson(e)),
        materials: (json['data'] as List)
            .map((e) => TeacherMaterials.fromJson(e))
            .toList());
  }
}

class TeacherMaterials {
  String? materialName;
  int? id;
  TeacherMaterials.fromJson(Map<String, dynamic> json) {
    materialName = json['name'];
    id = json['id'];
  }
}
