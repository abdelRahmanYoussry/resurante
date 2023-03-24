import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/data/models/get_student_model.dart';
import 'package:hassy/core/utils/network/base_entity.dart';

class GetStudentEntity extends BaseEntityResponse with EquatableMixin {
  final List<StudentData> studentData;
  GetStudentEntity({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required this.studentData,
  });

  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        studentData,
      ];
}
