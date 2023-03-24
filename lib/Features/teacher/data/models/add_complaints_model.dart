import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/add_complaints_entity.dart';

class AddComplaintsModel extends AddComplaintsEntity {
  AddComplaintsModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory AddComplaintsModel.fromJson(Map<String, dynamic> json) {
    return AddComplaintsModel(
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
