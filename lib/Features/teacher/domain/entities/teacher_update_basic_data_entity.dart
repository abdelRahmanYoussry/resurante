// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';

class UpdateBasicUserDataEntity extends BaseEntityResponse with EquatableMixin {
  final String name;
  final String address;
  final String birthDate;
  final String email;

  UpdateBasicUserDataEntity({
    required super.data,
    required this.name,
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
        name,
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
