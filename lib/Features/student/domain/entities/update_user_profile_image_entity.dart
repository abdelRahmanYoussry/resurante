import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/network/base_entity.dart';

class UpdateUserProfileImageEntity extends BaseEntityResponse
    with EquatableMixin {
  UpdateUserProfileImageEntity(
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
