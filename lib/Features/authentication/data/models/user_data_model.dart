// ignore_for_file: unused_import, unnecessary_null_in_if_null_operators

import '../../../../core/utils/network/base_broken_rules_entity.dart';
import '../../../../core/utils/network/base_data_entity.dart';
import '../../domain/entities/uesr_data_entity.dart';

class UserDataModel extends UserDataEntity {
  UserDataModel({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required super.userData,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        succeeded: json['succeeded'],
        message: json['message'].toString(),
        brokenRules: (json['brokenRules'] as List)
            .map((e) => BaseBrokenRulesEntity.fromJson(e))
            .toList(),
        isErrorMessageJson: json['isErrorMessageJson'],
        statusCode: json['statusCode'],
        data: [],
        // userData: (json['data']).map((e) => UserData.fromJson(e)),
        userData: UserData.fromJson(json['data']));
  }
}

class UserData {
  String? userName;
  String? email;
  String? idNumber;
  String? address;
  String? userImagePath;
  int? typeId;
  String? name;
  String? phoneNumber;
  String? birthDate;
  bool? isFirstStepCompleted;
  bool? isSecondStepCompleted;
  UserData.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    name = json['name'];
    email = json['email'];
    idNumber = json['idNumber'] ?? null;
    address = json['address'];
    userImagePath = json['userImagePath'];
    typeId = json['typeId'];
    birthDate = json['birthDate'];
    phoneNumber = json['phoneNumber'];
    isFirstStepCompleted = json['isFirstStepCompleted'];
    isSecondStepCompleted = json['isSecondStepCompleted'];
  }
}
