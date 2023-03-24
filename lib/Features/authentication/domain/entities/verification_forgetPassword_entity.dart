// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/network/base_entity.dart';

import '../../data/models/Verification_ForgetPassword_Model.dart';

class VerificationForgetPasswordEntity extends BaseEntityResponse
    with EquatableMixin {
  final VerificationForgetPassword verificationForgetPassword;
  VerificationForgetPasswordEntity(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode,
      required this.verificationForgetPassword});

  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        data,
        verificationForgetPassword
      ];
}
