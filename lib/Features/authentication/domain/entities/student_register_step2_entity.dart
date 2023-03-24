// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';

class StudentRegisterStep2Entity extends BaseEntityResponse
    with EquatableMixin {
  // final int eductionGradeId;

  StudentRegisterStep2Entity(
      {required super.data,
      // required this.eductionGradeId,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  //

  @override
  List<Object?> get props => [
        // eductionGradeId,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        data,
      ];
}
