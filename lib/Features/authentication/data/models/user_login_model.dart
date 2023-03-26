import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  UserLoginModel({
    required super.userName,
    required super.password,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.data,
  });
  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      userName: json['userName'].toString(),
      password: json['password'].toString(),
      data: json['data'].toString(),
    );
  }
}
