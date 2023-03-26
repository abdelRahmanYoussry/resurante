import 'package:equatable/equatable.dart';

class EducationSystemsEntity extends BaseEntityResponse with EquatableMixin {
  EducationSystemsEntity(
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
