// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/network/base_entity.dart';

class UserLoginEntity extends BaseEntityResponse with EquatableMixin {
  final String userName;
  final String password;
  UserLoginEntity({
    required this.userName,
    required this.password,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.data,
  });

  @override
  List<Object?> get props => [
        userName,
        password,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        data,
      ];
}
