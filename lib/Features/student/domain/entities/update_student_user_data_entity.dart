// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';

class UpdateStudentUserDataEntity extends BaseEntityResponse
    with EquatableMixin {
  // final int eductionGradeId;

  UpdateStudentUserDataEntity(
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
