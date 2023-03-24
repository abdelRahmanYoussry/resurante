// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';

class RegisterStepTwoEntity extends BaseEntityResponse with EquatableMixin {
  final String fullName;
  final String idNumber;
  final String address;
  final String birthDate;
  final String email;

  RegisterStepTwoEntity({
    required super.data,
    required this.fullName,
    required this.idNumber,
    required this.address,
    required this.birthDate,
    required this.email,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });

  //

  @override
  List<Object?> get props => [
        fullName,
        idNumber,
        address,
        birthDate,
        email,
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        data,
      ];
}
