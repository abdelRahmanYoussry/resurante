import 'package:hassy/Features/teacher/domain/entities/get_complaints_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class GetComplaintModel extends GetComplaintsEntity {
  GetComplaintModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.complaintsData,
  });
  factory GetComplaintModel.fromJson(Map<String, dynamic> json) {
    return GetComplaintModel(
        succeeded: json['succeeded'],
        message: json['message'].toString(),
        brokenRules: (json['brokenRules'] as List)
            .map((e) => BaseBrokenRulesEntity.fromJson(e))
            .toList(),
        isErrorMessageJson: json['isErrorMessageJson'],
        statusCode: json['statusCode'],
        data: [],
        complaintsData: (json['data'] as List)
            .map((e) => ComplaintsData.fromJson(e))
            .toList());
  }
}

class ComplaintsData {
  int? id;
  String? name;

  ComplaintsData({this.id, this.name});

  ComplaintsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
