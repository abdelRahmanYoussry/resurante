// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/get_privacy_policy_model.dart';

class GetPrivacyPolicyEntity extends BaseEntityResponse with EquatableMixin {
  final List<PrivacyPolicyData> privacyPolicyData;
  GetPrivacyPolicyEntity(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode,
      required this.privacyPolicyData});
  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        privacyPolicyData,
      ];
}
