// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/user_data_model.dart';

class UserDataEntity extends BaseEntityResponse with EquatableMixin {
  final UserData userData;
  UserDataEntity({
    required this.userData,
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
        userData
      ];
}
