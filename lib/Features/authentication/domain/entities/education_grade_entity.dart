import 'package:equatable/equatable.dart';

class EducationGradeEntity extends BaseEntityResponse with EquatableMixin {
  EducationGradeEntity(
      {required super.data,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
      ];
}
