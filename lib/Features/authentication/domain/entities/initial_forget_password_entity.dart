import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/network/base_entity.dart';

class InitialForgetPasswordEntity extends BaseEntityResponse
    with EquatableMixin {
  InitialForgetPasswordEntity({
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
