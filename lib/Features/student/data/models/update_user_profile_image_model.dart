import 'package:hassy/Features/student/domain/entities/update_user_profile_image_entity.dart';

import '../../../../core/utils/network/base_broken_rules_entity.dart';

class UpdateUserProfileImageModel extends UpdateUserProfileImageEntity {
  UpdateUserProfileImageModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });
  factory UpdateUserProfileImageModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserProfileImageModel(
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
