// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/get_teacher_personal_data_model.dart';

class GetTeacherPersonalEntity extends BaseEntityResponse with EquatableMixin {
  final TeacherPersonalData teacherPersonalData;
  GetTeacherPersonalEntity({
    required this.teacherPersonalData,
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });

  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        teacherPersonalData,
      ];
}
