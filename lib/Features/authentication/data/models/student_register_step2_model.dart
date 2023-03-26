import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../domain/entities/student_register_step2_entity.dart';

class StudentRegisterStep2Model extends StudentRegisterStep2Entity {
  StudentRegisterStep2Model(
      {required super.data,
      // required super.eductionGradeId,
      required super.succeeded,
      required super.message,
      required super.isErrorMessageJson,
      required super.brokenRules,
      required super.statusCode});

  factory StudentRegisterStep2Model.fromJson(Map<String, dynamic> json) {
    return StudentRegisterStep2Model(
      succeeded: json['succeeded'],
      message: json['message'].toString(),
      brokenRules: (json['brokenRules'] as List)
          .map((e) => BaseBrokenRulesEntity.fromJson(e))
          .toList(),
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: json['data'],
      // eductionGradeId: json['eductionGradeId']
    );
  }
}
