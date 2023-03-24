import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/get_privacy_policy_entity.dart';

class GetPrivacyPolicyModel extends GetPrivacyPolicyEntity {
  GetPrivacyPolicyModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.privacyPolicyData,
  });
  factory GetPrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return GetPrivacyPolicyModel(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: [],
      privacyPolicyData: (json['data'] as List)
          .map((e) => PrivacyPolicyData.fromJson(e))
          .toList(),
    );
  }
}

class PrivacyPolicyData {
  int? orderNo;
  String? title;
  String? body;

  PrivacyPolicyData({this.orderNo, this.title, this.body});

  PrivacyPolicyData.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
    title = json['title'];
    body = json['body'];
  }
}
