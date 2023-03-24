// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';

class InitialRegisterEntity extends BaseEntityResponse with EquatableMixin {
  final String userName;
  final String password;
  final String passwordConfirm;
  final String phone;
  final String typeId;

  InitialRegisterEntity(
      {required super.data,
      required this.userName,
      required this.password,
      required this.passwordConfirm,
      required this.phone,
      required this.typeId,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  //

  @override
  List<Object?> get props => [
        userName,
        password,
        passwordConfirm,
        phone,
        typeId,
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        data,
      ];
}
