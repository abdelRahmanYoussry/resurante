import 'package:equatable/equatable.dart';

class ForgetPasswordEntity extends BaseEntityResponse with EquatableMixin {
  ForgetPasswordEntity({
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.data,
  });

  @override
  List<Object?> get props => [
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        data,
      ];
}
